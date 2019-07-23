import isEmpty from '../functions/isEmpty'

const emptyPatient ={
  id:null,
    //Other attributes exists in patient but are not given defaults.
}

export default function reducer(state={
  //The outside layer is patients. Access by state.patients.item
  patients:[],
  patient:emptyPatient,
  measurements:{}

},action){
  switch(action.type){
    case "GET_PATIENTS":{
      return {...state, patients:action.payload}
    }
    case "GET_PATIENT":{
      const patient = action.payload.patient
      const measurements = action.payload.measurements
      if(isEmpty(measurements)){
        return {...state,patient:patient,patientFormLevel:'measurement'}
      }

      return {...state,patient:patient,measurements:measurements,patientFormLevel:'preview'}
    }

    case "SAVE_PATIENT":{
      return {...state,patient:action.payload}
    }

    case "SAVE_MEASUREMENTS":{
      //would only save the measurements to the db based on the patient information
      return {...state,measurements:action.payload}
    }

    case "DELETE_PATIENT":{
      return {...state}
    }

    case "CLEAR_PATIENT":{
      return {...state,patient:emptyPatient,measurements:{},patientFormLevel:'patient'}
    }
    

    default: return state
  }

}