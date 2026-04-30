/*Jordan Abel 4-29-2026*/

data class;
input id female tall grade;
datalines;
1 1 1 3
2 0 3 1
3 0 3 1
4 0 1 1
5 1 2 4
6 1 2 4
;
run;
proc cluster data=class method=centroid out=tree;
id id;
var Female Tall Grade;
run;

OPTIONS VALIDVARNAME=V7;

FILENAME REFFILE '/home/u64360188/sasuser.v94/Clustering_model.xlsx';

PROC IMPORT DATAFILE=REFFILE
    DBMS=XLSX
    OUT=WORK.cluster_model REPLACE;
    GETNAMES=YES;
RUN;

PROC VARCLUS DATA=cluster_model;
    VAR age aum risk_appetite fund_performance investment_potential investment_involvement complex_product;
RUN;
PROC CONTENTS DATA=WORK.cluster_model; RUN;
Proc varclus data=cluster_model;
var age aum risk_appetite fund_performance investment_potential investment_involvement complex_product;
run;
Proc cluster data=cluster_model method=ward ccc pseudo out=tree plots(MAXPOINTS=300);
id custid;
var age aum risk_appetite fund_performance investment_potential investment_involvement
complex_product;
run;
Proc tree data = tree out = cluster_output nclusters=5;
Id custid;
Copy age aum risk_appetite fund_performance investment_potential
investment_involvement complex_product;
Run;
proc print data=cluster_output(drop=clusname);
run;
/*Age and AUM have been dropped in the model*/
Proc varclus data=cluster_model;
Var risk_appetite fund_performance investment_potential investment_involvement
complex_product;
run;
/*Clustering*/
data class;
input id female tall grade;
datalines;
1 1 1 3
2 0 3 1
3 0 3 1
4 0 1 1
5 1 2 4
6 1 2 4
;
run;
proc cluster data=class method=centroid out=tree;
id id;
var Female Tall Grade;
run;
FILENAME REFFILE '/home/u64360188/sasuser.v94/Clustering_model.xlsx';
PROC IMPORT DATAFILE=REFFILE
DBMS=XLSX
OUT=WORK.cluster_model;
GETNAMES=YES;
RUN;
PROC CONTENTS DATA=WORK.cluster_model; RUN;
Proc varclus data=cluster_model;
var age aum risk_appetite fund_performance investment_potential investment_involvement complex_product;
run;
Proc cluster data=cluster_model method=ward ccc pseudo out=tree plots(MAXPOINTS=300);
id custid;
var age aum risk_appetite fund_performance investment_potential investment_involvement
complex_product;
run;
Proc tree data = tree out = cluster_output nclusters=5;
Id custid;
Copy age aum risk_appetite fund_performance investment_potential
investment_involvement complex_product;
Run;
proc print data=cluster_output(drop=clusname);
run;
/*Age and AUM have been dropped in the model*/
Proc varclus data=cluster_model;
Var risk_appetite fund_performance investment_potential investment_involvement
complex_product;
run;