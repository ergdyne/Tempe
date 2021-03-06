import React from 'react'
import PropTypes from 'prop-types'

export default class RadioInput extends React.Component {
  //Adjust default event to work with FormBuilder.
  checkInput = (event) => {
    const change = {
      name: this.props.name,
      label: this.props.label,
      value: event.target.value,
      validations: this.props.validations,
      isvalid: this.props.isvalid
    }
    this.props.onChange(change)
  }

  render() {
    return (
      <div
        key={this.props.name}
        className={`FormBuilder-radio ${(this.props.isvalid) ? '' : 'invalid'}`}
        data-tip={(this.props.isvalid) ? '' : this.props.errors}
      >
        {this.props.options.map(o => {
          return (<label key={`${this.props.name}-${o}`}>
            <input
              type="radio"
              value={o}
              name={this.props.name}
              checked={this.props.value === o}
              onChange={this.checkInput}
            />
            {o}
          </label>)
        })}
      </div>
    )
  }
}

RadioInput.propTypes = {
  onChange: PropTypes.func.isRequired,
  name: PropTypes.string.isRequired,
  value: PropTypes.string,
  options: PropTypes.arrayOf(
    PropTypes.string
  ),
  label: PropTypes.string.isRequired,
  isvalid: PropTypes.bool,
  errors: PropTypes.array,
  validations: PropTypes.object
}



