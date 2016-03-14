
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <meta content="A timepicker component for Twitter Bootstrap" name="description">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.0/css/bootstrap.min.css" type="text/css" media="screen" />
    <link href="assets/pygments.css" type="text/css" rel="stylesheet" />
    <link href="assets/prettify/prettify.css" type="text/css" rel="stylesheet" />
    <link href="assets/bootstrap/css/bootstrap-responsive.css" type="text/css" rel="stylesheet" />
    <link href="css/bootstrap-timepicker.min.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        body {
            padding-bottom: 40px;
            font-size: 16px;
            background: url('assets/images/bg.png');
        } 
        hr {
            border-color: #ddd;
        }
        hr.soften {
            background-image: -moz-linear-gradient(left center , transparent, rgba(0, 0, 0, 0.1), transparent);
            border: 0 none;
            height: 1px;
            margin: 15px 0;
        }
        .input-append {
            display: inline-block;
            vertical-align: middle;
            margin-bottom: 10px;
        }
        .hero-unit {
            color: #ffffff;
            text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
            background-color: #363636;
            *background-color: #222222;
            background-image: -moz-linear-gradient(top, #444444, #222222);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#444444), to(#222222));
            background-image: -webkit-linear-gradient(top, #444444, #222222);
            background-image: -o-linear-gradient(top, #444444, #222222);
            background-image: linear-gradient(to bottom, #444444, #222222);
            background-repeat: repeat-x;
            border-color: #222222 #222222 #000000;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff444444', endColorstr='#ff222222', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
        }

        @media (max-width: 480px) {
            .hero-unit h1 {
                font-size: 50px;
            }
            table.options-table td:nth-child(3), table th:nth-child(3) {
                display: none;
            }
        }
        .center {
            text-align: center;
        }
        .span4.center {
            padding-bottom: 20px;
        }

    </style>
    <title>Timepicker for Twitter Bootstrap</title>
<script type="text/javascript">
/* <![CDATA[ */
    (function() {
        var s = document.createElement('script'), t = document.getElementsByTagName('script')[0];
        s.type = 'text/javascript';
        s.async = true;
        s.src = 'http://api.flattr.com/js/0.6/load.js?mode=auto';
        t.parentNode.insertBefore(s, t);
    })();
/* ]]> */</script>
</head>
<body onload="prettyPrint()" data-target=".subnav" data-spy="scroll" data-twttr-rendered="true" >
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="http://jdewit.github.com/bootstrap-timepicker">Bootstrap-Timepicker</a>
          <div class="nav-collapse">
            <ul class="nav">
              <li><a href="index.html">Documentation</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
    <div class="container">
        <!-- Timepicker 
================================================== -->
<section id="timepicker">
    <div class="center hero-unit" style="margin: 0; padding: 0;">
        <br>
        <br>
        <br>
        <h1>Bootstrap Timepicker</h1>
        <br>
        <p class="lead">Easily select a time for a text input using your mouse or keyboards arrow keys.</p>
        <p><a href="http://travis-ci.org/jdewit/bootstrap-timepicker"><img style="max-width:100%; height: 15px;" alt="Build Status" src="https://secure.travis-ci.org/jdewit/bootstrap-timepicker.png" target="_blank"></a></p>
        <hr>
        <div class="row">
            <div class="span4 center">
                <a href="https://github.com/jdewit/bootstrap-timepicker" target="_blank" class="btn btn-large btn-primary"><i class="icon-share-alt icon-white"></i> View Github Project</a>
            </div>
            <div class="span4 center">
                <a href="http://www.pledgie.com/campaigns/19125"><img alt="Click here to support bootstrap-timepicker and make a donation with pledgie!" src="http://www.pledgie.com/campaigns/19125.png?skin_name=chrome" border="0" target="_blank"/></a>
            </div>
            <div class="span4 center">
<a class="FlattrButton" style="display:none;" rev="flattr;button:compact;" href="http://jdewit.github.com/bootstrap-timepicker"></a>
<noscript><a href="http://flattr.com/thing/1116513/Bootstrap-Timepicker" target="_blank">
<img src="http://api.flattr.com/button/flattr-badge-large.png" alt="Flattr this" title="Flattr this" border="0" /></a></noscript>
            </div>
        </div>
    </div>
    <br>
    <br>
    <h1>Installation</h1>
    <hr>
    <div>
        <p>This project is registered as a <a href="http://twitter.github.com/bower/">Bower</a> package.</p>
<pre class="prettyprint linenums">
    $ bower install bootstrap-timepicker
</pre>
    </div>
    <hr>
    <h1>Demos</h1>
    <hr>
    <p>Default timepicker. Value = (<span id="timeDisplay"></span>)</p> 
    <div class="input-append bootstrap-timepicker">
        <input id="timepicker1" class="input-small" type="text"/><span class="add-on"><i class="icon-time"></i></span>
    </div>
    &nbsp;
    <a href="#timepicker1Source" data-toggle="collapse">+ View Source</a>
    <div id="timepicker1Source" class="collapse">
<pre class="prettyprint linenums">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
    &lt;head&gt;
        &lt;meta http-equiv="Content-Type" content="text/html; charset=utf-8" /&gt;
        &lt;link type="text/css" href="css/bootstrap.min.css" /&gt;
        &lt;link type="text/css" href="css/bootstrap-timepicker.min.css" /&gt;
        &lt;script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"&gt;&lt/script&gt;
        &lt;script type="text/javascript" src="js/bootstrap-2.2.2.min.js"&gt;&lt;/script&gt;
        &lt;script type="text/javascript" src="js/bootstrap-timepicker.min.js"&gt;&lt;/script&gt;
    &lt;/head&gt;
    &lt;body&gt;
        &lt;div class="input-append bootstrap-timepicker"&gt;
            &lt;input id="timepicker1" type="text" class="input-small"&gt;
            &lt;span class="add-on"&gt;&lt;i class="icon-time"&gt;&lt;/i&gt;&lt/span&gt;
        &lt;/div&gt;

        &lt;script type="text/javascript"&gt;
            $('#timepicker1').timepicker();
        &lt;/script&gt;
    &lt;/body&gt;
&lt;/html&gt;
</pre>
    </div>
    <hr class="soften">
    <p>Inside a modal with 24hr mode and seconds enabled.</p>
    <div class="input-append bootstrap-timepicker">
        <input id="timepicker2" class="input-small" type="text"/><span class="add-on"><i class="icon-time"></i></span>
    </div>
    &nbsp;
    <a href="#timepicker2Source" data-toggle="collapse">+ View Source</a>
    <div id="timepicker2Source" class="collapse">
<pre class="prettyprint linenums">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
    &lt;head&gt;
        &lt;meta http-equiv="Content-Type" content="text/html; charset=utf-8" /&gt;
        &lt;link type="text/css" href="css/bootstrap.min.css" /&gt;
        &lt;link type="text/css" href="css/bootstrap-timepicker.min.css" /&gt;
        &lt;script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"&gt;&lt/script&gt;
        &lt;script type="text/javascript" src="js/bootstrap-2.2.2.min.js"&gt;&lt;/script&gt;
        &lt;script type="text/javascript" src="js/bootstrap-timepicker.min.js"&gt;&lt;/script&gt;
    &lt;/head&gt;
    &lt;body&gt;
        &lt;div class="input-append bootstrap-timepicker"&gt;
            &lt;input id="timepicker2" type="text" class="input-small"&gt;
            &lt;span class="add-on"&gt;
                &lt;i class="icon-time"&gt;&lt;/i&gt;
            &lt/span&gt;
        &lt;/div&gt;

        &lt;script type="text/javascript"&gt;
            $('#timepicker2').timepicker({
                minuteStep: 1,
                template: 'modal',
                appendWidgetTo: 'body',
                showSeconds: true,
                showMeridian: false,
                defaultTime: false
            });
        &lt;/script&gt;
    &lt;/body&gt;
&lt;/html&gt;
</pre>
   </div>
   <hr class="soften">
   <p>Without component markup, keyboard input disabled and floated right.</p>
   <div class="bootstrap-timepicker pull-right" style="height: 2em;">
        <a  href="#timepicker3Source" data-toggle="collapse">+ View Source </a>
        &nbsp;
       <input id="timepicker3" class="input-small" type="text" />
   </div>
   <br>
   <br>
   <div id="timepicker3Source" class="collapse">
<pre class="prettyprint linenums">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
    &lt;head&gt;
        &lt;meta http-equiv="Content-Type" content="text/html; charset=utf-8" /&gt;
        &lt;link type="text/css" href="css/bootstrap.min.css" /&gt;
        &lt;link type="text/css" href="css/bootstrap-timepicker.min.css" /&gt;
        &lt;script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"&gt;&lt/script&gt;
        &lt;script type="text/javascript" src="js/bootstrap-2.2.2.min.js"&gt;&lt;/script&gt;
        &lt;script type="text/javascript" src="js/bootstrap-timepicker.min.js"&gt;&lt;/script&gt;
    &lt;/head&gt;
    &lt;body&gt;
        &lt;div class="bootstrap-timepicker pull-right"&gt;
            &lt;input id="timepicker3" type="text" class="input-small"&gt;
        &lt;/div&gt;

        &lt;script type="text/javascript"&gt;
            $('#timepicker3').timepicker({
                minuteStep: 5,
                showInputs: false,
                disableFocus: true
            });
        &lt;/script&gt;
    &lt;/body&gt;
&lt;/html&gt;
</pre>
   </div>
   <hr class="soften">
   <p>Inside a modal with backdrop enabled, inputs disabled and with a preset value.</p>
		<div id="timepicker4Modal" class="modal hide fade"> 
			<div class="modal-header">
				<h1>A Timepicker Inside A Modal</h1>
			</div>
			<div class="modal-body" style="min-height: 150px;">
				 <span class="bootstrap-timepicker" style="vertical-align: middle;">
						 <input id="timepicker4" class="input-small" value="10:35 AM" type="text" />
						 <i class="icon-time" style="margin: -2px 0 0 -22.5px; pointer-events: none; position: relative;"></i>
				 </span>
			</div>
			<div class="modal-footer">
				<a href="#" class="btn btn-primary" data-dismiss="modal">OK</a>
			</div>
		</div>
   &nbsp;
   &nbsp;
		<a class="btn btn-primary" href="#timepicker4Modal" data-toggle="modal">Open Modal</a>
   <a href="#timepicker4Source" data-toggle="collapse"> + View Source</a>

   <div id="timepicker4Source" class="collapse">
<pre class="prettyprint linenums">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
    &lt;head&gt;
        &lt;meta http-equiv="Content-Type" content="text/html; charset=utf-8" /&gt;
        &lt;link type="text/css" href="css/bootstrap.min.css" /&gt;
        &lt;link type="text/css" href="css/bootstrap-timepicker.min.css" /&gt;
        &lt;script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"&gt;&lt/script&gt;
        &lt;script type="text/javascript" src="js/bootstrap-2.2.2.min.js"&gt;&lt;/script&gt;
        &lt;script type="text/javascript" src="js/bootstrap-timepicker.min.js"&gt;&lt;/script&gt;
    &lt;/head&gt;
    &lt;body&gt;
				&lt;div&gt; class="modal hide fade"&gt; 
					&lt;div class="modal-header"&gt;
						&lt;h1&gt;Timepicker inside a modal&lt;/h1&gt; 
					&lt;/div&gt;
					&lt;div class="modal-body"&gt;
						&lt;div class="bootstrap-timepicker"&gt;
								&lt;input id="timepicker4" type="text" value="10:35 AM" class="input-small"&gt;
								&lt;i class="icon-time"&gt;&lt;/i&gt;
						&lt;/div&gt;
					&lt;/div&gt;
				&lt;/div&gt;

        &lt;script type="text/javascript"&gt;
            $('#timepicker4').timepicker({
                minuteStep: 1,
                secondStep: 5,
                showInputs: false,
                template: 'modal',
                modalBackdrop: true,
                showSeconds: true,
                showMeridian: false
            });
        &lt;/script&gt;
    &lt;/body&gt;
&lt;/html&gt;
</pre>
   </div>
   <hr class="soften">
   <p>Without a template.</p>
   <span class="bootstrap-timepicker">
       <input id="timepicker5" class="input-small" type="text" />
       <i class="icon-time" style="margin: -2px 0 0 -22.5px; pointer-events: none; position: relative;"></i>
   </span>
    &nbsp;
    <a href="#timepicker5Source" data-toggle="collapse"> + View Source</a>
   <div id="timepicker5Source" class="collapse">
<pre class="prettyprint linenums">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
    &lt;head&gt;
        &lt;meta http-equiv="Content-Type" content="text/html; charset=utf-8" /&gt;
        &lt;link type="text/css" href="css/bootstrap.min.css" /&gt;
        &lt;link type="text/css" href="css/bootstrap-timepicker.min.css" /&gt;
        &lt;script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"&gt;&lt/script&gt;
        &lt;script type="text/javascript" src="js/bootstrap-2.2.2.min.js"&gt;&lt;/script&gt;
        &lt;script type="text/javascript" src="js/bootstrap-timepicker.min.js"&gt;&lt;/script&gt;
    &lt;/head&gt;
    &lt;body&gt;
        &lt;div class="bootstrap-timepicker"&gt;
            &lt;input id="timepicker5" type="text" class="input-small"&gt;
            &lt;i class="icon-time"&gt;&lt;/i&gt;
        &lt;/div&gt;

        &lt;script type="text/javascript"&gt;
            $('#timepicker5').timepicker({
                template: false,
                showInputs: false,
                minuteStep: 5
            });
        &lt;/script&gt;
    &lt;/body&gt;
&lt;/html&gt;
</pre>
    </div>
    <hr>
    <h1>Configuration</h1>
    <hr>
    <h3>template <small>The picker widget template</small></h3>
    <div class="well">
        <table class="options-table table table-bordered table-striped table-rounded">
            <thead>
                <tr>
                    <th style="width: 25%;">Name</th>
                    <th style="width: 25%;">Options / Defaults</th>
                    <th style="widget: 50%;">Description</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>template</td>
                    <td>
                        'dropdown' (default)<hr /> 
                        'modal' <hr />
                        false
                    </td>
                    <td>
                        Show picker in a dropdown <hr />
                        Show picker in a modal <hr />
                        Don't show a widget
                    </td>
                </tr>
                <tr>
                    <td>minuteStep</td>
                    <td>15</td>
                    <td>Specify a step for the minute field.</td>
                </tr>
                <tr>
                    <td>showSeconds</td>
                    <td>false</td>
                    <td>Show the seconds field.</td>
                </tr>
                <tr>
                    <td>secondStep</td>
                    <td>15</td>
                    <td>Specify a step for the second field.</td>
                </tr>
                <tr>
                    <td>defaultTime</td>
                    <td>
                        'current' (default) <hr />
                        '11:45 AM' <hr />
                        false
                    </td>
                    <td>
                        Set to the current time. <hr />
                        Set to a specific time. <hr />
                        Do not set a default time
                    </td>
                </tr>
                <tr>
                    <td>showMeridian</td>
                    <td>
                        true (default) <hr />
                        false 
                    </td>
                    <td>
                        12hr mode<hr />
                        24hr mode
                    </td>
                </tr>
                <tr>
                    <td>showInputs</td>
                    <td>
                        true (default) <hr />
                        false 
                    </td>
                    <td>
                        Shows the text inputs in the widget. <hr />
                        Hide the text inputs in the widget
                    </td>
                </tr>
                <tr>
                    <td>disableFocus</td>
                    <td>false</td>
                    <td>Disables the input from focusing. This is useful for touch screen devices that display a keyboard on input focus.</td>
                </tr>
                <tr>
                    <td>disableMousewheel</td>
                    <td>false</td>
                    <td>Disables the input from changing on mousewheel events</td>
                </tr>
                <tr>
                    <td>modalBackdrop</td>
                    <td>false</td>
                    <td>Show modal backdrop.</td>
                </tr>
            </tbody>
        </table>
    </div>
    <div>
        <h3>Data Attributes</h3>
        <p>Configuration options can also be set with the use of data attributes. </p>
<pre class="prettyprint linenums">
  &lt;div class="bootstrap-timepicker"/&gt;&lt;input id="timepicker" data-template="modal" data-minute-step="1" data-modal-backdrop="true" type="text"/&gt;&lt;/div&gt;
</pre>
    </div>
    <hr>
    <h1>Methods</h1>
    <hr>
    <h3>showWidget <small>Show the picker widget</small></h3>
<pre class="prettyprint linenums">
  var time = $('#timepicker').timepicker('showWidget');
</pre>
    <h3>setTime <small>Set the time manually</small></h3>
<pre class="prettyprint linenums">
  $('#timepicker').timepicker('setTime', '12:45 AM');
</pre>
    <hr>
    <h1>Events</h1>
    <hr>
    <div>
        <h3> Show <small>Triggered when dropdown/modal widget is shown</small></h3>
<pre class="prettyprint linenums">
  $('#timepicker').timepicker().on('show.timepicker', function(e) {
    console.log('The time is ' + e.time.value);
    console.log('The hour is ' + e.time.hour);
    console.log('The minute is ' + e.time.minute);
    console.log('The meridian is ' + e.time.meridian);
  });
</pre>
        <h3>Hide <small>Triggered when widget is hidden</small></h3>
<pre class="prettyprint linenums">
  $('#timepicker').timepicker().on('hide.timepicker', function(e) {
    console.log('The time is ' + e.time.value);
    console.log('The hour is ' + e.time.hour);
    console.log('The minute is ' + e.time.minute);
    console.log('The meridian is ' + e.time.meridian);
  });
</pre>
        <h3>Update <small>Triggered when the date is updated</small></h3>
<pre class="prettyprint linenums">
  $('#timepicker').timepicker().on('changeTime.timepicker', function(e) {
    console.log('The time is ' + e.time.value);
    console.log('The hour is ' + e.time.hour);
    console.log('The minute is ' + e.time.minute);
    console.log('The meridian is ' + e.time.meridian);
  });
</pre>
<hr>
    </div>
</section>



    </div> <!-- /container -->
    <hr />

    <footer class="container">
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>Created by <a href="http://twitter.com/joris_dewit" target="_blank">Joris de Wit</a> and many <a href="https://github.com/jdewit/bootstrap-timepicker/graphs/contributors">contributors</a></p> 
    </footer>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.2.2/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/prettify/prettify.js"></script>
    <script type="text/javascript" src="js/bootstrap-timepicker.js"></script>
    <script type="text/javascript">
        $(document).ready(function () { 
            $('#timepicker1').timepicker();

            $('#timepicker2').timepicker({
                minuteStep: 1,
                template: 'modal',
                appendWidgetTo: 'body',
                showSeconds: true,
                showMeridian: false,
                defaultTime: false
            });

            $('#timepicker3').timepicker({
                minuteStep: 5,
                showInputs: false,
                disableFocus: true
            });

            $('#timepicker4').timepicker({
                minuteStep: 1,
                secondStep: 5,
                showInputs: false,
                modalBackdrop: true,
                showSeconds: true,
                showMeridian: false
            });

            $('#timepicker5').timepicker({
                template: false,
                showInputs: false,
                minuteStep: 5
            });

            setTimeout(function() {
              $('#timeDisplay').text($('#timepicker1').val());
            }, 100);

            $('#timepicker1').on('changeTime.timepicker', function(e) {
              $('#timeDisplay').text(e.time.value);
            });
        });
    </script>
</body>
</html>
