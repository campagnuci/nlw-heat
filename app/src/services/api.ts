import axios from 'axios'

export const api = axios.create({
  baseURL: 'http://10.111.143.128:4000'
})
