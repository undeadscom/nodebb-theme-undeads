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

