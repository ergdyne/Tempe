import React from 'react'
import PropTypes from 'prop-types'
import DatePicker from "react-datepicker"
import "react-datepicker/dist/react-datepicker.css"

export default class DateSelect extends React.Component {

  //Passes configuration into built in change.
  checkInput = (date) => {
    const change = {
      name: this.props.name,
      label: this.props.label,
      value: date,
      validations: this.props.validations,
      isvalid: this.props.isvalid
    }
    this.props.onChange(change)
  }

  render() {
    return (
      <div className={`FormBuilder-date`}>
        <label
          data-tip={this.props.instruction}
        >
          {`${this.props.label}: `}
          <span 
            className={`${(this.props.isvalid) ? '' : 'invalid'}`}
            data-tip={(this.props.isvalid) ? '' : this.props.errors}>
            <DatePicker
              selected={this.props.value}
              onChange={this.checkInput}
            />
          </span>
        </label>
      </div>
    )
  }


}

DateSelect.propTypes = {
  onChange: PropTypes.func.isRequired,
  value: PropTypes.instanceOf(Date),
  name: PropTypes.string.isRequired,
  label: PropTypes.string.isRequired,
  instruction: PropTypes.string,
  isvalid: PropTypes.bool,
  errors: PropTypes.array,
  validations: PropTypes.object
}