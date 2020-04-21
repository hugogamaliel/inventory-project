<!doctype html>
<html lang="en-US">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
  <title>Input Autocomplete Suggestions Demo</title>
  <link rel="shortcut icon" href="http://designshack.net/favicon.ico">
  <link rel="icon" href="http://designshack.net/favicon.ico">
  <link rel="stylesheet" type="text/css" media="all" href="style.css">
  <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="js/jquery.autocomplete.min.js"></script>
  <script type="text/javascript" src="js/currency-autocomplete.js"></script>
</head>

<body>
  <div id="topbar"><a href="http://designshack.net">Back to Design Shack</a></div>
  <div id="w">
    <div id="content">
      <h1>World Currencies Autocomplete Search</h1>
      <p>Just start typing and results will be supplied from the JavaScript. Check out <a href="https://github.com/devbridge/jQuery-Autocomplete">jQuery Autocomplete</a> on Github.</a></p>
      
      <div id="searchfield">
        <form><input type="text" name="currency" class="biginput" id="autocomplete"></form>
      </div><!-- @end #searchfield -->
      
      <div id="outputbox">
        <p id="outputcontent">Choose a currency and the results will display here.</p>
      </div>
      
    </div><!-- @end #content -->
  </div><!-- @end #w -->
</body>
</html>
