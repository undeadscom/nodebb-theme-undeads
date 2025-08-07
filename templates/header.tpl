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
					<div class="popover-content">
						<div class="popover-content-list">
						<ul>
							<li>
								<a href="https://www.gate.io/trade/UDS_USDT" target="_blank">
									<!-- IMPORT partials/icon-gate-io.tpl -->
									<p>Gate.io</p>
									<p>UDS / USDT</p>
								</a>
							</li>
							<li>
								<a href="https://www.mexc.com/exchange/UDS_USDT" target="_blank">
									<!-- IMPORT partials/icon-mexc.tpl -->
									<p>MEXC</p>
									<p>UDS / USDT</p>
								</a>
							</li>
							<li>
								<a href="https://www.weex.com/trade/UDS-USDT" target="_blank">
									<!-- IMPORT partials/icon-weex.tpl -->
									<p>WEEX</p>
									<p>UDS / USDT</p>
								</a>
							</li>
							<li>	
								<a href="https://www.coinstore.com/spot/udsusdt" target="_blank">
									<!-- IMPORT partials/icon-coinstore.tpl -->
									<p>Coinstore</p>
									<p>UDS / USDT</p>
								</a>
							</li>
							<li>
								<a href="https://www.biconomy.com/exchange/UDS_USDT" target="_blank">
									<!-- IMPORT partials/icon-biconomy.tpl -->
									<p>Biconomy.com</p>
									<p>UDS / USDT</p>
								</a>
							</li>
							<li>
								<a href="https://bingx.com/en/spot/UDSUSDT" target="_blank">
									<!-- IMPORT partials/icon-bingx.tpl -->
									<p>BingX</p>
									<p>UDS / USDT</p>
								</a>
							</li>
							<li>
								<a href="https://www.xt.com/en/trade/uds_usdt" target="_blank">
									<!-- IMPORT partials/icon-xt.tpl -->
									<p>XT.COM</p>
									<p>UDS / USDT</p>
								</a>
							</li>
							<li>
								<a href="https://coinmarketcap.com/exchanges/uniswap-v3/" target="_blank">
									<!-- IMPORT partials/icon-uniswap.tpl -->
									<p>Uniswap v3</p>
									<p>UDS / USDT</p>
								</a>
							</li>
						</ul>
						 </div>
					</div>
				</a>
			
			</div>
		</div>
		<script>
		document.addEventListener('DOMContentLoaded', function() {
			var config = JSON.parse('{{configJSON}}');
			if (config.env === 'development') {
				fetch('https://api-gateway.zombiesdev.com/rates/UDS/USD').then((res) => res.json()).then(data => {
					const udsData = data.data
					const udsPrice = document.querySelector('.rate-value-1');
					const lastDayChanges = document.querySelector('#lastDay')
					const percentageChange24h = udsData.percentageChange24h.toFixed(2)
					lastDayChanges.className = percentageChange24h > 0 ? 'rate-value-2-positive' : 'rate-value-2-negative'
					lastDayChanges.innerHTML = percentageChange24h > 0 ?  '+' + percentageChange24h + '%' : percentageChange24h + '%'
					udsPrice.innerHTML = `$` + udsData.price
				});
			} else {
				fetch('https://api.undeads.com/rates/UDS/USD').then((res) => res.json()).then(data => {
					const udsData = data.data
					const udsPrice = document.querySelector('.rate-value-1');
					const lastDayChanges = document.querySelector('#lastDay')
					const percentageChange24h = udsData.percentageChange24h.toFixed(2)
					lastDayChanges.className = percentageChange24h > 0 ? 'rate-value-2-positive' : 'rate-value-2-negative'
					lastDayChanges.innerHTML = percentageChange24h > 0 ?  '+' + `${percentageChange24h}` + '%' : percentageChange24h + '%'
					udsPrice.innerHTML = `$` + udsData.price
				});
			}
				
			});
		</script>
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
								<a href="https://undeads.com/tokenomics" class="slide-button">
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
  loop: true,

  pagination: {
    el: '.swiper-pagination',
	clickable: true,
  },
});
</script>


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
