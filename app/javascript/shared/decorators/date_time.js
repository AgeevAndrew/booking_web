export const dateTimeFormat = (dateTimeString) => {
  if (!dateTimeString) return null
  const options = { year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit' }
  return new Intl.DateTimeFormat('ru-RU', options).format(dateTimeFromString(dateTimeString))
}

export function dateTimeFromString(dateTimeString) {
  if (!dateTimeString) return null
  return new Date(dateTimeString)
}
