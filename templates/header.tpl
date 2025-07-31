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

		<div class="header-slider-container px-4">
			<!-- IMPORT partials/header/brand.tpl -->
			<div class="swiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div class="slide-content slide-content-1">
							<div class="slide-left">
								<h3 class="slide-title">Spin your Wheel of Fortune!</h3>
								<p class="slide-description">Earn or purchase spins to test your luck. Spin the Wheel of Fortune and win amazing prizes!</p>
								<a href="/wheel-of-fortune" class="slide-button">
									Spin now
								</a>
							</div>
							<div class="slide-right-1">
								<img src="https://cdn.undeads.com/assets/forum/header-slider/slide1.png" alt="Wheel of Fortune" class="slide-image">
							</div>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="slide-content slide-content-2">
							<div class="slide-left-2">
								<h3 class="slide-title-2">Paired Staking</h3>
								<div class="slide-button-container">
								<a href="/app/staking" class="slide-button">
									Stake $UDS
								</a>
								</div>
							</div>
							<div class="slide-center-2">
								<div class="slide-center-content">
									<div class="slide-center-text">
										<img src="https://cdn.undeads.com/assets/forum/header-slider/slide-2-icon-1.png" alt="APR icon" class="slide-center-icon">
										Earn up to 50% APR
									</div>
									<div class="slide-center-text">
										<img src="https://cdn.undeads.com/assets/forum/header-slider/slide-2-icon-2.png" alt="NFT icon" class="slide-center-icon">
										Boost earnings with NFTs
									</div>
									<div class="slide-center-text">
										<img src="https://cdn.undeads.com/assets/forum/header-slider/slide-2-icon-3.png" alt="Earn icon" class="slide-center-icon">
										Play, HODL & earn more
									</div>
								</div>
							</div>
							<div class="slide-right-2">
								<img src="https://cdn.undeads.com/assets/forum/header-slider/slide2.png" alt="Stake $UDS" class="slide-image">
							</div>
							<div class="slide-button-container-small">
								<a href="/app/staking" class="slide-button">
									Stake $UDS
								</a>
							</div>
						</div>

					</div>
					<div class="swiper-slide">
						<div class="slide-content slide-content-3">
							<div class="slide-left-3">
								<img src="https://cdn.undeads.com/assets/forum/header-slider/slide3-left.png" alt="UDS Left" class="slide-image">
							</div>
							<div class="slide-center-3">
								<h3 class="slide-title-3">Buy UDS!</h3>
								<p class="slide-description-3">Buy UDS with popular exchanges! Make purchases and claim rewards!</p>
								<a href="#link3" class="slide-button">
									Buy UDS
								</a>
							</div>
							<div class="slide-right-3">
								<img src="https://cdn.undeads.com/assets/forum/header-slider/slide3-right.png" alt="UDS Right" class="slide-image">
							</div>
						</div>
					</div>

				</div>
			<div class="swiper-pagination"></div>
		</div>
		<div class="container-lg px-md-4 d-flex flex-column gap-3 h-100 mb-5 mb-lg-0" id="content"></div>
			<!-- IMPORT partials/noscript/warning.tpl -->
			<!-- IMPORT partials/noscript/message.tpl -->




<script>
  const swiper = new Swiper('.swiper', {
  // Optional parameters
  loop: true,
  initialSlide: 2,

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
