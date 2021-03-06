import React, { Component } from 'react'
import PropTypes from 'prop-types'
import ReactDOM from 'react-dom'
import * as THREE from 'three'
import STLLoaderModule from 'three-stl-loader'
import OrbitControlsModule from 'three-orbit-controls'
import ScaleLoader from 'react-spinners/SyncLoader'

//Much of this file was converted from an example of STLLoader for Three.
//The point of it: load multiple STL files into a scene so the user can preview them.

const STLLoader = STLLoaderModule(THREE)
const OrbitControls = OrbitControlsModule(THREE)

export default class Canvas extends Component {

  componentDidMount() {
    this.renderModel(this.props)
  }

  //Currying the onLoad (adds mesh to scene) function with common aspects of the scene.
  onLoadBuilder(scene, camera, renderer) {
    const material = new THREE.MeshPhongMaterial({ color: 0x00ff00, specular: 0x0f2045, shininess: 0 })
    //Curry the STL object to get details such as mesh name and position/rotation.
    return (stl) => {
      //Return the standard load function which takes a geometry. The single geometry input is dictated by the loader.
      return (geometry) => {
        let mesh = new THREE.Mesh(geometry, material)
        mesh.name = stl.type
        if(stl.rotation){mesh.rotation.set(stl.rotation.x, stl.rotation.y, stl.rotation.z)}
        if(stl.position){mesh.position.set(stl.position.x, stl.position.y, stl.position.z)}
        mesh.scale.set(.04, .04, .04)
        mesh.castShadow = true
        mesh.receiveShadow = false

        //Remove the old file of this type and add the new one.
        scene.remove(scene.getObjectByName(stl.type))
        scene.add(mesh)

        ReactDOM.findDOMNode(this).replaceChild(renderer.domElement,ReactDOM.findDOMNode(this).firstChild)

        renderer.render(scene, camera)
      }
    }
  }

  renderModel(props) {
    const { stls, width, height, backgroundColor, sceneClassName, orbitControls } = props
    //Sometimes this sort of copy the component thing is needed. I don't know if this is one of those, but it is what the example did...
    let component = this;

    let renderer = new THREE.WebGLRenderer({
      preserveDrawingBuffer: true,
      antialias: true
    })
    renderer.setSize(width, height)
    renderer.setClearColor(backgroundColor, 1)
    renderer.domElement.className = sceneClassName

    let scene = new THREE.Scene()
    let distance = 500

    //Add light sources; otherwise the model will be black and without detail.
    var spotLight = new THREE.SpotLight(0xaaaaaa);
    spotLight.position.set(-50, -50, -50);
    scene.add(spotLight)
    scene.add(new THREE.AmbientLight(0x999999))

    let camera = new THREE.PerspectiveCamera(30, width / height, 1, distance)
    camera.up.set(0, 0, 1)
    camera.position.set(0, -44, 20)
    scene.add(camera);

    if (orbitControls) {
      let controls = new OrbitControls(camera, ReactDOM.findDOMNode(component));
      controls.enableKeys = false;
      controls.addEventListener('change', () => renderer.render(scene, camera));
    }

    //Curry the onLoad with the common elements.
    let onLoad = this.onLoadBuilder( scene, camera, renderer)

    const loader = new STLLoader();

    //Load each STL and curry the callback function.
    stls.map(x => loader.load(x.link, onLoad(x)))

  }

  //Not sure if any of these lifecyle items are required?
  //For future experiementation and cleanup. Check if these impact the rendering.
  shouldComponentUpdate(nextProps, nextState) {
    if (JSON.stringify(nextProps) === JSON.stringify(this.props)) {
      return false
    }
    return true
  }

  componentDidUpdate(nextProps, nextState) {
    this.renderModel(nextProps);
  }

  componentDidCatch(error, info) {
    console.log(error, info)
  }
  //End possible cleanup area.

  render() {
    return (
      <div
        className={this.props.className}
        style={{
          width: this.props.width,
          height: this.props.height,
          overflow: 'hidden',
        }}
      >
        <div style={{
          height: '100%',
          display: 'flex',
          justifyContent: 'center',
          alignItems: 'center',
        }}>
          {/* Provides the loading element until the files come in*/}
          <ScaleLoader
            color={'#FF4444'}
            loading={true}
          />
        </div>
      </div>
    );
  };
}

Canvas.propTypes = {
  stls: PropTypes.arrayOf(PropTypes.object).isRequired,
  backgroundColor: PropTypes.string,
  modelColor: PropTypes.string,
  height: PropTypes.number,
  width: PropTypes.number,
  rotate: PropTypes.bool,
  orbitControls: PropTypes.bool,
  sceneClassName: PropTypes.string
}

Canvas.defaultProps = {
  backgroundColor: '#EAEAEA',
  modelColor: '#44FF44',
  height: 400,
  width: 400,
  rotate: true,
  orbitControls: true,
  sceneClassName: ''
}