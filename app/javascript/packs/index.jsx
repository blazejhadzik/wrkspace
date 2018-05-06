import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import App from './components/App'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <App />,
    document.getElementById('todolist')
  )
})
