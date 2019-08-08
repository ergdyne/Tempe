import formatValue from '../functions/formatValue'
import React from 'react'


export default function SimpleAttribute(x, obj){
  return ((obj[x.accessor]) ?
    <label key={`header-${x.accessor}`} className="row">
      {`${x.name}: `}
      <span className="col-sm-2" >
        {formatValue(x.type, obj[x.accessor])}
      </span>
    </label> : <span />
  )
}