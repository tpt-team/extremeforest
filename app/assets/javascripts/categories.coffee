dropdown = document.querySelectorAll('.dropdown')
dropdownArray = Array::slice.call(dropdown, 0)
dropdownArray.forEach (el) ->
  button = el.querySelector('a[data-toggle="dropdown"]')
  menu = el.querySelector('.dropdown-menu')
  arrow = button.querySelector('i.icon-arrow')

  button.onclick = (event) ->
    if !menu.hasClass('show')
      menu.classList.add 'show'
      menu.classList.remove 'hide'
      arrow.classList.add 'open'
      arrow.classList.remove 'close'
      event.preventDefault()
    else
      menu.classList.remove 'show'
      menu.classList.add 'hide'
      arrow.classList.remove 'open'
      arrow.classList.add 'close'
      event.preventDefault()
    return

  return

Element::hasClass = (className) ->
  @className and new RegExp('(^|\\s)' + className + '(\\s|$)').test(@className)


submenus = document.querySelectorAll('ul.sub-menu')
if submenus.length > 0
  i = 0
  while i < submenus.length
    span = document.createElement('span')
    span.classList.add 'expand'
    span.innerHTML = '+'
    span.addEventListener 'click', ->
      @classList.toggle 'active'
      # this.nextElementSibling.classList.toggle('active');
      @parentNode.classList.toggle 'active'
    submenus[i].previousElementSibling.appendChild span
    submenus[i].parentNode.insertBefore span, submenus[i]
    i++
do ->
  `var i`
  clickToggle = document.querySelectorAll('[data-toggle-class]')

  toggleClasses = (classes, obj) ->
    if !classes
      return
    if !obj
      return
    n = 0
    while n < classes.length
      obj.classList.toggle classes[n].trim()
      n++

  applyToTargets = (targetslist, dototargets, obj, dotoself, dotonext) ->
    if !targetslist
      return
    if !dototargets
      return
    targetslist = targetslist.split(',')
    n = 0
    while n < targetslist.length
      targetslist[n] = targetslist[n].trim()
      if (targetslist[n] == 'this' or targetslist[n] == 'self') and obj and dotoself
        dotoself obj
      if targetslist[n] == 'next' and obj and dotonext
        dotonext obj.nextElementSibling
      else
        elems = document.querySelectorAll(targetslist[n])
        if elems.length > 0
          m = 0
          while m < elems.length
            dototargets elems[m]
            m++
      n++

  if clickToggle.length > 0
    i = 0
    while i < clickToggle.length
      clickToggle[i].addEventListener 'click', (e) ->
        e.preventDefault()
        classes = @getAttribute('data-toggle-class')
        if !classes
          return
        classes = classes.split(',')
        n = 0
        while n < classes.length
          classes[n] = classes[n].trim()
          n++
        targets = @getAttribute('data-toggle-target')
        if !targets
          toggleClasses classes, this
        else
          applyToTargets targets, ((elem) ->
            toggleClasses classes, elem
          ), this, ((elem) ->
            toggleClasses classes, elem
          ), (elem) ->
            toggleClasses classes, elem
      i++
