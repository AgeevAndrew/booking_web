export const tiding_status = (status) => {
    switch (status) {
        case 'on':
            return 'green'
        case 'off':
            return 'red'
        default:
            return 'grey'
    }
}
