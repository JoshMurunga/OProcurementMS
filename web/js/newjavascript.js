(function (init) {

	init(window.jQuery, window, document);

})(function($, window, document) {

	// jQuery DOMReady event handler -- BEGIN
	$(function() {

		$('.dataTabularized').DataTable();

		$('.button-collapse').sideNav();
		$('.parallax').parallax();
		$('.modal-trigger').leanModal();

		$('select').material_select();

	});
	// jQuery DOMReady event handler -- END

});

(function (execApp) {

	execApp(window.jQuery, window, document);

})(function($, window, document) {

	var gVars = window.gVars,
		clipIds = [],
		playerIds = [];



	// jQuery DOMReady event handler -- BEGIN
	$(function() {

		// Allow users to preview clips
		$('#clips_table').on('click', '.btn-clip-preview', function() {

			var src = $(this).attr('data-iframe-src');
			$('.video-container', '#clip-preview').html('<iframe width="720" height="405" src="' + src + '" frameborder="0" allowfullscreen></iframe>');
			$('#clip-preview').openModal({
				dismissible: true,
				complete: function() {
					$('iframe', '#clip-preview').remove();
				}
			});

			// .on('click', '.btn-clip-preview') -- END
		});

		$('#videos_table').on('click', '.btn-select-match', function() {

			var $this = $(this),
				vid = $this.attr('rr-vid');

			if ($this.hasClass('active')) return;

			$('.main-progress').show();

			getClipsAsync(vid).done(function(data, textStatus, jqXHR) {

				populateClipsTable($('#clips_table'), data);
				$('.btn-select-match', '#videos_table').removeClass('active');
				$this.addClass('active');
				clipIds.length = 0;
				$('#clip_ids').val('');
			})
			.fail(function(jqXHR, textStatus, error) {
				console.log('Uh oh,', error);
			})
			.always(function() {
				$('.main-progress').hide();
			});
		});

		$('#clips_table').on('click', '[type=checkbox]', function() {

			var $this = $(this),
				clipId = $this.attr('rr-clip-id');

			if ($this.prop('checked')) {
				clipIds.push(clipId);
			} else {
				clipIds = _.without(clipIds, clipId);
			}

			$('#clip_ids').val(clipIds.join());
		});

		$('#players_table').on('click', '[type=checkbox]', function() {

			var $this = $(this),
				playerId = $this.attr('rr-player-id');

			if ($this.prop('checked')) {
				playerIds.push(playerId);
			} else {
				playerIds = _.without(playerIds, playerId);
			}

			$('#player_ids').val(playerIds.join());
		});

		$('#players_collection').on('click', 'a', function() {

			var $this = $(this);

			$('a', '#players_collection').removeClass('active');
			$this.addClass('active');
			$('.clips-table-for-player').removeClass('active');
			$('#clips_table_for_player_' + $this.attr('rr-player-id')).addClass('active');
		});

	});
	// jQuery DOMReady event handler -- END



	// Get clips info using AJAX
	function getClipsAsync(vid) {

		return $.ajax({
			url: gVars.getClipsAsyncURL,
			type: 'post',
			dataType: 'json',
			data: { vid: vid }
		});
	}

	function populateClipsTable($tableEl, data) {

		var content = '', clipInfo,
			isAssignPage = ($tableEl.parents('#assign_page').length > 0),
			isEditPage = ($tableEl.parents('#clip_edit_page').length > 0);

		for (var i = 0, n = data.length; i < n; i ++) {

			clipInfo = data[i];

			content += '<tr>';

			if (isAssignPage) {
				content += '<td>';
					content += '<input type="checkbox" id="clip_' + clipInfo.id + '" class="filled-in no-label" rr-clip-id="' + clipInfo.id + '">';
					content += '<label for="clip_' + clipInfo.id + '" style="vertical-align: middle;"></label>';
				content += '</td>';
			}
				content += '<td>';
					content += '<a href="javascript:;" class="waves-effect waves-green btn-flat btn btn-clip-preview" data-iframe-src="' + clipInfo.embed_url + '" style="padding: 0 5px; text-transform: none;">' + clipInfo.name + '</a>';
				content += '</td>';
				content += '<td>' + clipInfo.start + '</td>';
				content += '<td>' + clipInfo.stop + '</td>';

			if (isEditPage) {
				content += '<td></td>';
			}
			content += '</tr>';
		}
		$tableEl.find('tbody').html(content);
	}

});