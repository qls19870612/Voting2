(function($){
  $(function(){
    
     
      /*M.AutoInit();*/
 //https://materializecss.com/parallax.html
 

/*          $('.button-collapse').sideNav();
          $('.parallax').parallax();

          $('.datepicker').pickadate({
              selectMonths: true, // Creates a dropdown to control month
              selectYears: 15 // Creates a dropdown of 15 years to control year
          });

          $('select').material_select();*/


          $('.sidenav').sidenav();
          $('.parallax').parallax();
          $('select').formSelect();
        
          $(".datepicker").datepicker({
              format: 'yyyy-mm-dd',
              i18n: {
                  cancel: '取消',
                  clear: '清除',
                  done: '确定',
                  months: [
                      '一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'
                  ],
                  monthsShort: [
                      '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'
                  ],
                  weekdays: [
                      '周日', '周一', '周二', '周三', '周四', '周五', '周六'
                  ],
                  weekdaysShort: [
                      '周日', '周一', '周二', '周三', '周四', '周五', '周六'
                  ],
                  weekdaysAbbrev: [
                      '日', '一', '二', '三', '四', '五', '六'
                  ]
              }
          });
        $('')
      
   ;
 
   
  }); // end of document ready
})(jQuery); // end of jQuery name space