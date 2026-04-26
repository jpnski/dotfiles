const ENABLED_EVENTS = new Set([
  'permission.asked',
  'question.asked',
  'session.error',
])

const DEBOUNCE_MS = 1200

export default {
  id: "notify-bell",
  tui: async (api) => {
    const bell = '\x07'
    const last = new Map()

    const ring = (key, now = Date.now()) => {
      const prev = last.get(key) || 0
      if (now - prev < DEBOUNCE_MS) return
      last.set(key, now)
      process.stdout.write(bell)
    }

    for (const eventType of ENABLED_EVENTS) {
      api.event.on(eventType, (event) => {
        const key = event.properties?.sessionID
          ? `${event.type}:${event.properties.sessionID}`
          : event.type
        ring(key)
      })
    }
  },
}