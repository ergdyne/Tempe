import axios from 'axios'
import { recordsToPatients, patientMeasurementStatesToMeasurements } from '../functions/convertView'
import {AXIOS_CONFIG, API_URL} from '../config/API'

export function getPatients() {
  return function (dispatch) {
    axios.get(`${API_URL}patient/all`,AXIOS_CONFIG)
      .then((response) => {
        const patients = recordsToPatients(response.data)
        dispatch({ type: "GET_PATIENTS", payload: patients })
      })
      .catch((err) => {
        dispatch({ type: "GET_PATIENTS_REJECTED", payload: err })
      })
  }
}

export function getPatient(patientId) {
  return function (dispatch) {
    axios.post(`${API_URL}patient/one`, {
      patientId: patientId
    },AXIOS_CONFIG)
      .then((response) => {
        //Well really just one patient...
        const patients = recordsToPatients(response.data.patientRecords)
        
        //TODO add devices?
        //But just in case there is a problem...TODO should ===1?
        if (patients.length > 0) {
          var patient = patients[0]
          //add the groupName to the patient
          patient.groupName = response.data.groupName
          dispatch({ type: "GET_PATIENT", payload: {patient: patient, measurements:[]} })
        }else{
          dispatch({ type: "GET_PATIENT_REJECTED", payload: 'Something wrong with data.' })
        }
      })
      .catch((err) => {
        dispatch({ type: "GET_PATIENT_REJECTED", payload: err })
      })
  }
}

export function savePatient(patient, inputs, groupName) {
  console.log("inputs", inputs)
  var patientAttributes = inputs.map(i => (
    {
      recordId: i.recordId,
      value: patient[i.accessor]
    }
  )
  ).filter(a => a.value != null)

  console.log('p ats', patientAttributes)
  //TODO check if changes
  if (patientAttributes.length > 0) {
    return function (dispatch) {
      axios.post(`${API_URL}patient/save`, {
        patientId: patient.id,
        patientInputs: patientAttributes,
        groupName: groupName
      }, AXIOS_CONFIG)
        .then((response) => {
          //This updates the patient id locally
          patient.id = response.data.patientId
          dispatch({ type: "SAVE_PATIENT", payload: patient })
          dispatch({type: "SET_EDIT_PATIENT", payload: false})
        })
        .catch((err) => {
          dispatch({ type: "SAVE_PATIENT_REJECTED", payload: err })
        })
    }
  }
  return {
    type: "SAVE_PATIENT_REJECTED",
    payload: {}
  }
}

export function setDevice(device,deviceData,deviceInputs){
  const deviceAttributes = deviceInputs.map(i => (
    {
      recordId: i.recordId,
      value: deviceData[i.accessor]
    }
  )
  ).filter(a => a.value != null)

  device.deviceData=deviceAttributes
  return {
    type:"SET_DEVICE",
    payload:device
  }
}

//TODO better define what inputs is and such
export function saveMeasurements(measurements, measurementInputs, patientId, device) {
  const deviceMeasurements = measurementInputs.map(i => (
    {
      recordId: i.recordId,
      value: measurements[i.accessor]//parse float?
    }
  )
  ).filter(a => a.value != null)

    console.log("to send", deviceMeasurements, patientId, device)

  //TODO validate data and check for changes
  if (deviceMeasurements.length > 0) {
    return function (dispatch) {
      axios.post(`${API_URL}patient/save_device`, {
        patientId: patientId,
        deviceId: device.deviceId,
        patientDeviceId: device.patientDeviceId,
        measurements: deviceMeasurements.concat(device.deviceData)
      },AXIOS_CONFIG)
        .then((response) => {
          //use the response to set device id

          console.log("resp on save data",response.data)
          dispatch({ type: "SAVE_MEASUREMENTS", payload: measurements })
          dispatch({type: "SET_EDIT_DEVICE", payload:false})
        })
        .catch((err) => {
          dispatch({ type: "SAVE_MEASUREMENTS_REJECTED", payload: err })
        })
    }
  }
  return {
    type: "SAVE_MEASUREMENTS_REJECTED",
    payload: {}
  }
}


export function deletePatient(patientId) {
  return {
    type: "DELETE_PATIENT",
    payload: { patientId: patientId }
  }
}

export function clearPatient() {
  return {
    type: "CLEAR_PATIENT",
    payload: {}
  }
}


