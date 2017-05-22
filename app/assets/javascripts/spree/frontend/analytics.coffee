console.log "indeed"
$(document).ready ->
  !do ->
    analytics = window.analytics = window.analytics or []
    if !analytics.initialize
      if analytics.invoked
        window.console and console.error and console.error('Segment snippet included twice.')
      else
        analytics.invoked = !0
        analytics.methods = [
          'trackSubmit'
          'trackClick'
          'trackLink'
          'trackForm'
          'pageview'
          'identify'
          'reset'
          'group'
          'track'
          'ready'
          'alias'
          'debug'
          'page'
          'once'
          'off'
          'on'
        ]

        analytics.factory = (t) ->
          ->
            e = Array::slice.call(arguments)
            e.unshift t
            analytics.push e
            analytics

        t = 0
        while t < analytics.methods.length
          e = analytics.methods[t]
          analytics[e] = analytics.factory(e)
          t++

        analytics.load = (t) ->
          `var e`
          e = document.createElement('script')
          e.type = 'text/javascript'
          e.async = !0
          e.src = (if 'https:' == document.location.protocol then 'https://' else 'http://') + 'cdn.segment.com/analytics.js/v1/' + t + '/analytics.min.js'
          n = document.getElementsByTagName('script')[0]
          n.parentNode.insertBefore e, n
          return

        analytics.SNIPPET_VERSION = '4.0.0'
        analytics.load window.segment_key
    return

$(document).on "turbolinks:load", ->
  if window.logged_in_user
    analytics.identify window.userID, {
      email: window.userEmail
    }, Intercom: user_hash: window.intercomHash

  analytics.page()
