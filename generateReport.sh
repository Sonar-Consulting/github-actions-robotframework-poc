#!/bin/bash
cd reports

listreports=(*/) 

listreports=("${listreports[@]%/}")   

length="${#listreports[@]}"

echo $length

finalReport="${listreports[length-1]}";

start_html='
<!doctype html> 
<html>
   <head>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.14.1/dist/css/uikit.min.css" />
   </head>
   <body>
      <nav class="uk-navbar-container" uk-navbar>
         <div class="uk-navbar-left">
            <h2 class="uk-text-center">Execution Reports</h2>
         </div>
      </nav>
      <div class=uk-grid>
         <div>
            <h3> Latest execution report :
               <a class=uk-link href="reports/'$finalReport'/report.html" />'$finalReport' </a>
            </h3>
         </div>
         <div>
            <h3 class="uk-text-right">Number of reports: <span class=uk-label> '$length'</span></h3>
         </div>
         <br>
         <br>
         <br>
         <br>
         <br>
         <hr>
      </div>
      <div class=uk-container>
      <hr class="uk-divider-icon">
      <h2>
      Historical Reports:
      <table class="uk-table uk-table-striped">
      <tbody>
'
      
end_html='</tbody></table></div></body></html>';

inner_html='';

for d in "${listreports[@]}";do
      inner_html+='<tr><td><h4><a class=uk-link href="reports/'$d'/report.html">'$d'</a></h4></td></tr>'
done;

cd ..
echo $start_html$inner_html$end_html > index.html
