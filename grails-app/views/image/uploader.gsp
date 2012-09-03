<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>


  </head>
  <body>Place your content here

  <form action="/image/postImage" method="post" enctype="multipart/form-data"  id="imageform">
      <input type="file" name="photoimg" id="photoimg" />

  </form>

  <div id='preview'>
  </div>


 		<g:render template="/commons/js" />
  <script src="/js/jquery.form.js"></script>


  <script type="text/javascript">

      $(document).ready(function() {
          $('#photoimg').live('change', function() {
              $("#preview").html('');
              $("#preview").html('<div class="progress progress-striped active"><div class="bar" style="width: 100%;"></div></div>');
              $("#imageform").ajaxForm(
                      {
                          target: '#preview'
                      }).submit();
          });
      });

  </script>

  </body>
</html>