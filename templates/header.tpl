<!DOCTYPE html>
<html lang="{function.localeToHTML, userLang, defaultLang}" {{{if languageDirection}}}data-dir="{languageDirection}" style="direction: {languageDirection};"{{{end}}}>
<head>
	<title>{browserTitle}</title>
	{{{each metaTags}}}{function.buildMetaTag}{{{end}}}
	<link rel="stylesheet" type="text/css" href="{relative_path}/assets/client{{{if bootswatchSkin}}}-{bootswatchSkin}{{{end}}}{{{ if (languageDirection=="rtl") }}}-rtl{{{ end }}}.css?{config.cache-buster}" />
	{{{each linkTags}}}{function.buildLinkTag}{{{end}}}

	<script>
		var config = JSON.parse('{{configJSON}}');
		var app = {
			user: JSON.parse('{{userJSON}}')
		};
		document.documentElement.style.setProperty('--panel-offset', `0px`);
	</script>

	{{{if useCustomHTML}}}
	{{customHTML}}
	{{{end}}}
	{{{if useCustomCSS}}}
	<style>{{customCSS}}</style>
	{{{end}}}

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@700&family=Manrope:wght@400;800&display=swap" rel="stylesheet">
	
	<link
  		rel="stylesheet"
  		href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
	/>
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
</head>

<body class="{bodyClass} skin-{{{if bootswatchSkin}}}{bootswatchSkin}{{{else}}}noskin{{{end}}}">
	<a class="visually-hidden-focusable position-absolute top-0 start-0 p-3 m-3 bg-body" style="z-index: 1021;" href="#content">[[global:skip-to-content]]</a>

	{{{ if config.theme.topMobilebar }}}
	<!-- IMPORT partials/mobile-header.tpl -->
	{{{ end }}}

	<div class="layout-container d-flex justify-content-between pb-4 pb-md-0">
		<!-- IMPORT partials/sidebar-left.tpl -->

		<span class="rate">
  			USD 1234 rate: {externalRate}
		</span>

		<main id="panel" class="d-flex flex-column gap-3 flex-grow-1 mt-3" style="min-width: 0;">


			<div class="container-lg px-md-4 d-flex flex-column gap-3 h-100 mb-5 mb-lg-0" id="content">

							<div class="swiper">
  			<div class="swiper-wrapper">
    			<div class="swiper-slide">
    				<div class="slide-content slide-content-first">
    					<div class="slide-left">
    						<h3 class="slide-title">Spin your Wheel of Fortune!</h3>
    						<p class="slide-description">Earn or purchase spins to test your luck. Spin the Wheel of Fortune and win amazing prizes!</p>
    						<a href="#link1" class="slide-button">
    							Spin now
    						</a>
    					</div>
    					<div class="slide-right">
    						<img src="https://cdn.undeads.com/assets/forum/header-slider/slide1.png" alt="Wheel of Fortune" class="slide-image">
    					</div>
    				</div>
    			</div>
    			<div class="swiper-slide">
    				<div class="slide-content">
    					<h3>Слайд 2</h3>
    					<p>Описание второго слайда</p>
    					<a href="#link2" class="slide-button">
    						Перейти
    					</a>
    				</div>
    			</div>
   				<div class="swiper-slide">
   					<div class="slide-content">
   						<h3>Слайд 3</h3>
   						<p>Описание третьего слайда</p>
   						<a href="#link3" class="slide-button">
   							Перейти
   						</a>
   					</div>
   				</div>
  			</div>
  			<div class="swiper-pagination"></div>
		</div>


<script>
  const swiper = new Swiper('.swiper', {
  // Optional parameters
  loop: true,

  // If we need pagination
  pagination: {
    el: '.swiper-pagination',
	clickable: true,
  },

  // Navigation arrows
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },

  // And if we need scrollbar
  scrollbar: {
    el: '.swiper-scrollbar',
  },
});
</script>
