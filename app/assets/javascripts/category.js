$(function() {
  $(document).on('turbolinks:load', ()=> {

    $(function(){
      function appendOption(category){
        var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
        return html;
      }
  
      function appendChidrenBox(insertHTML){
        var childSelectHtml = '';
        childSelectHtml = `<div class='listing-select-wrapper__added' id= 'children_wrapper'>
                            <div class='listing-select-wrapper__box'>
                              <select class="listing-select-wrapper__box--select" id="child_category" name="item[category_id]">
                                <option value="カテゴリ選択" data-category="カテゴリ選択">カテゴリ選択</option>
                                ${insertHTML}
                              <select>
                            </div>
                          </div>`;
        $('.listing-product-detail__category').append(childSelectHtml);
      }
  
      function appendGrandchidrenBox(insertHTML){
        var grandchildSelectHtml = '';
        grandchildSelectHtml = `<div class='listing-select-wrapper__added' id= 'grandchildren_wrapper'>
                                  <div class='listing-select-wrapper__box'>
                                    <select class="listing-select-wrapper__box--select" id="grandchild_category" name="item[category_id]">
                                      <option value="カテゴリ選択" data-category="カテゴリ選択">カテゴリ選択</option>
                                      ${insertHTML}
                                    </select>
                                  </div>
                                </div>`;
        $('.listing-product-detail__category').append(grandchildSelectHtml);
      }
  
      $('#parent_category').on('change', function(){
        var parentCategory = document.getElementById('parent_category').value; 
        if (parentCategory != "カテゴリ選択"){ 
          $.ajax({
            url: 'get_category_children',
            type: 'GET',
            data: { parent_id : parentCategory },
            dataType: 'json'
          })
          .done(function(children){
            $('#children_wrapper').remove(); 
            $('#grandchildren_wrapper').remove();
            var insertHTML = '';
            children.forEach(function(child){
              insertHTML += appendOption(child);
            });
    
            appendChidrenBox(insertHTML);
          })
          .fail(function(){
            alert('カテゴリー取得に失敗しました');
          })
        }else{
          $('#children_wrapper').remove();
          $('#grandchildren_wrapper').remove();
        }
      });
  
      $('.listing-product-detail__category').on('change', '#child_category', function(){
        var childId = $('#child_category option:selected').data('category'); 
        if (childId != "カテゴリ選択"){ 
          $.ajax({
            url: 'get_category_grandchildren',
            type: 'GET',
            data: { child_id: childId },
            dataType: 'json'
          })
          .done(function(grandchildren){
            if (grandchildren.length != 0) {
              $('#grandchildren_wrapper').remove();
              var insertHTML = '';
              grandchildren.forEach(function(grandchild){
                insertHTML += appendOption(grandchild);
              });
              appendGrandchidrenBox(insertHTML);
            }
          })
          .fail(function(){
            alert('カテゴリー取得に失敗しました');
          })
        }else{
          $('#grandchildren_wrapper').remove(); 
        }
      });
    });
  })
}, false);
