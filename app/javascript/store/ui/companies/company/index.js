const initialState = {
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
    shedules: {},
}

export default (state = initialState, action) => {
    const { type, order } = action
    return state
}
