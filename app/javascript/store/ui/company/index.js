import schedules from './modal'
import { combineReducers } from 'redux'
export const initialSate = {
    name: '',
    categories: '',
    description: '',
    contactInfo: {
        email: '',
        phone: '',
        geotag: [],
        geotagCafe: [],
    },
    delivery: {
        cost: '',
        period: {
            end: '',
            start: '',
        },
        freeShipping: '',
        pickupDiscount: '',
    },
    schedules: schedules.initialState,
}
export default combineReducers({
    schedules,
})


