# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  initDatepickers()
  initEventSearchButtonHandler()

initDatepickers = ->
  $startDate = $('.js-start-date')
  $endDate = $('.js-end-date')

  $startDate.datetimepicker
    format : 'DD/MM/YYYY HH:mm'

  $endDate.datetimepicker
    useCurrent: false,
    format : 'DD/MM/YYYY HH:mm'

  $startDate.on 'dp.change', (e)->
    $endDate.data('DateTimePicker').minDate(e.date.add(1, 'm'))

  $endDate.on 'dp.change', (e)->
    $startDate.data('DateTimePicker').maxDate(e.date.subtract(1, 'm'))

initEventSearchButtonHandler = ->
  $(document).on 'click', '.js-event-filter-btn', ->
    $btn = $(@)
    params = $btn.closest('form').serialize()
    window.location = $btn.data('url') + '?' + params
