export const tidingStatus = (status) => {
    switch (status) {
        case 'on':
            return 'green'
        case 'off':
            return 'grey'
        default:
            return 'grey'
    }
}
