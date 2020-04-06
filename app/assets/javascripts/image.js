$(function() {
  $(document).on('turbolinks:load', ()=> {
    $(function(){
      // 画像用のinputを生成する関数    
      const buildFileField = (num)=> {
        const html = `<label>
                        <div data-index="${num}" class="js-file_group">
                          <p>選択</p>
                          <input class="js-file" type="file" name="item[images_attributes][${num}][image]" id="item_images_attributes_${num}_src">
                          <div class="js-remove">削除</div>
                        </div>
                      </label>`;
        return html;
      }
      // プレビュー用のimgタグを生成する関数
      const buildImg = (index, url)=> {
        const html = `<img data-index="${index}" src="${url}" width="110px" height="110px">`;
        return html;
      }
    
      // file_fieldのnameに動的なindexをつける為の配列
      let fileIndex = [1,2,3,4,5];
      // 既に使われているindexを除外
      lastIndex = $('.js-file_group:last').data('index');
      fileIndex.splice(0, lastIndex);
    
      $('.hidden-destroy').hide();
    
      $('#image-box').on('change', '.js-file', function(e) {
        const targetIndex = $(this).parent().data('index');
        // ファイルのブラウザ上でのURLを取得する
        const file = e.target.files[0];
        const blobUrl = window.URL.createObjectURL(file);
    
        // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
        if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
          img.setAttribute('src', blobUrl);
        } else {  // 新規画像追加の処理
          $('#previews').append(buildImg(targetIndex, blobUrl));
          // fileIndexの先頭の数字を使ってinputを作る
          $('#image-box').append(buildFileField(fileIndex[0]));
          fileIndex.shift();
          // 末尾の数に1足した数を追加する
          fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
        }
        if ('img[data-index=="4"]') {
          $('div[data-index="5"]').remove();
        };
      });
    
      $('#image-box').on('click', '.js-remove', function() {
        const targetIndex = $(this).parent().data('index');
        // 該当indexを振られているチェックボックスを取得する
        const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
        // もしチェックボックスが存在すればチェックを入れる
        if (hiddenCheck) hiddenCheck.prop('checked', true);
    
        $(this).parent().remove();
        $(`img[data-index="${targetIndex}"]`).remove();
    
        // 画像入力欄が0個にならないようにしておく
        if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
      });
    });
  })
}, false);