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
	<script src="https://unpkg.com/@popperjs/core@2"></script>
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
		<div class="external-rate">
			<a href="https://www.coingecko.com/en/coins/undeads-games" class="rate-block-clickable">
				<img src="https://cdn.undeads.com/assets/icons/uds@2x.png" alt="UDS" class="uds-icon">
				<span class="rate-label">UDS:</span>
				<span class="rate-value-1">${rates.price}</span>
			</a>
			<div class="rate-divider"></div>
			<div class="rate-block">
				<span class="rate-label">24h:</span>
				<span id="lastDay" class="rate-value-2-{{{ if rates.isPositivePercentageChange24h }}}positive{{{ else }}}negative{{{ end }}}">{rates.percentageChange24h}%</span>
			</div>
			<div class="rate-divider"></div>
			<div id="popover-btn" class="rate-block-clickable">
				<span class="rate-label">Trade UDS</span>
				  <svg id="arrow" class="rate-label-arrow" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
   					 <path d="M6.97 5.25a.7.7 0 0 0 0 1.02L9.84 9.025 6.97 11.782a.7.7 0 0 0 0 1.018.772.772 0 0 0 1.06 0l3.932-3.774L8.03 5.25a.772.772 0 0 0-1.06 0z" fill-rule="evenodd" />
  				</svg>
			</div>
			<div id="popover-content" role="tooltip">
				{{{ each popoverData }}}
					<a href="{popoverData.link}" target="_blank" class="popover-item">
						<div class="popover-content">
							<img src="{popoverData.icon}" alt="{popoverData.name}" class="popover-icon">
							<div class="popover-name">{popoverData.name}</div>
							<div class="popover-description">{popoverData.description}</div>
						</div>
					</a>
				{{{ end }}}
			</div>
		</div>
			<!-- IMPORT partials/custom/slider.tpl -->
		<div class="container-lg px-md-4 d-flex flex-column gap-3 h-100 mb-5 mb-lg-0" id="content"></div>
			<!-- IMPORT partials/noscript/warning.tpl -->
			<!-- IMPORT partials/noscript/message.tpl -->

<script>
  document.addEventListener('DOMContentLoaded', () => {
    const button = document.querySelector('#popover-btn');
    const tooltip = document.querySelector('#popover-content');
    const popoverInstance = Popper.createPopper(button, tooltip, {
      placement: 'bottom',
    });

	function toggleArrow(isVisible) {
		const arrow = document.querySelector('#arrow');
		arrow.style.transform =	isVisible ? `rotate(0deg)` : `rotate(+90deg)`;
	}

    function togglePopover() {
      const isVisible = getComputedStyle(tooltip).display !== 'none';
      tooltip.style.display = isVisible ? 'none' : 'block';
	  toggleArrow(isVisible)
      popoverInstance.update();
    }

    function closePopover() {
      tooltip.style.display = 'none';
      popoverInstance.update();
    }

    button.addEventListener('click', (e) => {
      e.stopPropagation();
      togglePopover();
    });

    tooltip.addEventListener('click', (e) => {
      e.stopPropagation();
    });

    document.addEventListener('click', (e) => {
      const isVisible = getComputedStyle(tooltip).display !== 'none';
      if (isVisible && 
          !tooltip.contains(e.target) && 
          !button.contains(e.target)) {
		toggleArrow(isVisible)
        closePopover();
      }
    });
  });


</script>
