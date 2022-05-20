#!/bin/bash
cd reports
arr=(*/) 
arr=("${arr[@]%/}")       
length="${#arr[@]}"
finalReport="${arr[length-1]}";
html='
<!doctype html> 
<html>
   <head>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.14.1/dist/css/uikit.min.css" />
   </head>
   <body>
      <nav class="uk-navbar-container" uk-navbar>
         <div class="uk-navbar-left">
            <h2 class="uk-heading-medium">Execution Reports</h2>
         </div>
         <h2 class="uk-align-right">Number of reports: <span class=uk-label> '$length'</span></h2>
      </nav>
      <div class=uk-container uk-card-body>
         <p>
         <h3 class=uk-text-center> Latest execution report :
            <a class=uk-link href="reports/'$finalReport'/report.html" />'$finalReport' </a>
         </h3>
         </p>
      </div>
      <div class=uk-container>
      <h2>
      Historical Reports:
      <table class="uk-table uk-table-striped">
      <tbody>'
      
endhtml='</tbody></table></div></body></html>'
innerHtml='';
for d in "${arr[@]}";do
      innerHtml+='<tr><td><h4><a class=uk-link href="reports/'$d'/report.html">'$d'</a></h4></td></tr>'
done;
cd ..
echo $html$innerHtml$endhtml > index.html
