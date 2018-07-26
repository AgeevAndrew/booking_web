export const getHumanNameWeekDay = (weekDay) => {
    switch (weekDay) {
        case 'sun':
            return 'Воскресенье'
        case 'mon':
            return 'Понедельник'
        case 'tue':
            return 'Вторник'
        case 'wed':
            return 'Среда'
        case 'thu':
            return 'Четверг'
        case 'fri':
            return 'Пятница'
        case 'sat':
            return 'Суббота'
    }
}
