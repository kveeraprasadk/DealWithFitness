//* Taken from a codrops article https://tympanus.net/Tutorials/ShapeHoverEffectSVG/ *\\



var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-7243260-2']);
_gaq.push(['_trackPageview']);
(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();

(function() {
  
        function init() {
          var speed = 250,
            easing = mina.easeinout;

          [].slice.call ( document.querySelectorAll( '#grid > a' ) ).forEach( function( el ) {
            var s = Snap( el.querySelector( 'svg' ) ), path = s.select( 'path' ),
              pathConfig = {
                from : path.attr( 'd' ),
                to : el.getAttribute( 'data-path-hover' )
              };

            el.addEventListener( 'mouseenter', function() {
              path.animate( { 'path' : pathConfig.to }, speed, easing );
            } );

            el.addEventListener( 'mouseleave', function() {
              path.animate( { 'path' : pathConfig.from }, speed, easing );
            } );
          } );
        }

        init();

      })();
