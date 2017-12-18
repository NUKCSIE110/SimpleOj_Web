$(document).on('turbolinks:load', function(){
  MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
  MathJax.Hub.config.SVG.useFontCache = false;
  MathJax.Hub.Queue(["Rerender", MathJax.Hub]);
});
