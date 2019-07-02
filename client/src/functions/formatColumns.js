import React from 'react'
import moment from 'moment'

//Format columns for use in react-table
//Meant to be reusable on single action lists
//Maybe make a multiple callback function version
//TODO, an action type vs static type vs formated type
export default function formatColumns(columns, onClick, caption) {
  return (
    columns.map(x => {
      return ({
        Header: x.name,
        accessor: x.accessor,
        Cell: props => {
          switch (x.type) {
            case 'date': return (<span>{(props.value == null || props.value == '')?'':moment(props.value).format('LL')}</span>)
            //This id thing is a bit messy. I don't think it is worth it.
            //What am I trying to achieve? Something like reusability and database programability...
            case 'id': return((caption==="")?<span/>:<button onClick={()=>onClick(props.value)}>{caption}</button>)
            default: return(<span>{props.value}</span>)
          }
        }
      })
    })
  )
}