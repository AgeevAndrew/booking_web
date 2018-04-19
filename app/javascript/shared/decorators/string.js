export const truncateString = (body, len) => `${body.substring(0, len)}${body.length >= len ? '...' : ''}`
