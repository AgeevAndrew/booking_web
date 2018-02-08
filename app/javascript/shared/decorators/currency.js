export const currency = (number) =>
  new Intl.NumberFormat('ru', { style: 'currency', currency: 'RUB' }).format(number || 0)
