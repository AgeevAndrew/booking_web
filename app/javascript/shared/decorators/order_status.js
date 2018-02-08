export const statusColor = (status) => {
  switch (status) {
    case 'Новый':
      return 'orange'
    case 'Отменен':
      return 'red'
    case 'Подтвержден':
      return 'green'
    default:
    return 'grey'
  }
}
