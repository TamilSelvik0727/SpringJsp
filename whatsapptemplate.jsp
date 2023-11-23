<%@ include file="../commonImports/common_imports.jsp"%>
<%@page
	import="java.io.*,java.util.*,javax.servlet.http.HttpServletResponse,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpSession"%>
<%@page import="com.sf.kgisl.administration.model.TemplateVO"%>
<!DOCTYPE HTML>
<html>
<head>
<!-- <meta charset="utf-8"> -->
<!-- <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE11" > -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, minimal-ui" />-->
<title>Kurnia Insurance</title>
<%
	String contextPath = request.getContextPath();
%>

<%
	if (session.getAttribute("templateVO") != null) {
		List<TemplateVO> templateVO = (List<TemplateVO>) session.getAttribute("templateVO");
	}
%>
<script type="text/javascript">
var contextPath = "<%=contextPath%>
	";
</script>
<link href="<c:url value="/springResources/mycss/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="/springResources/myjs/jquery.js" />"></script>
<script src="<c:url value="/springResources/myjs/jquery-ui.js" />"></script>
<link href="<c:url value="/springResources/mycss/jquery-ui.css" />"
	rel="stylesheet">
<link href="<c:url value="/springResources/mycss/jquery-smooth.css" />"
	rel="stylesheet">
<link href="<c:url value="/springResources/admincss/admin.css" />"
	rel="stylesheet">
<link href="<c:url value="/springResources/theme/altercss/mycss.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/springResources/admincss/jquery.dataTables.min.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/springResources/admincss/responsive.dataTables.min.css" />"
	rel="stylesheet">
<script
	src="<c:url value="/springResources/modeljs/bootstrap.min.js" /> "></script>
<script
	src="<c:url value="/springResources/myjs_quotation/jquery-confirm.js" />"></script>
<link
	href="<c:url value="/springResources/mycss_quotation/jquery-confirm.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/springResources/quotation/altercss/skinBrown.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/springResources/mycss_quotation/font-awesome.css" />"
	rel="stylesheet">
<script
	src="<c:url value="/springResources/common/commonfunction.js" />"></script>
<script>
	var BASE_URL = "${pageContext.request.contextPath}"
</script>
<script src="<c:url value="/springResources/myjs/bootbox.min.js" />"></script>
<script
	src="<c:url value="/springResources/modeljs/bootstrap.min.js" />"></script>
<script
	src="<c:url value="/springResources/datatablejs/jquery.dataTables.min.js" />"></script>
<script
	src="<c:url value="/springResources/datatablejs/dataTables.responsive.min.js" />"></script>
<script
	src="<c:url value="/springResources/validatejs/jquery.validate.js" />"></script>
<script
	src="<c:url value="/springResources/theme/lib/select2/select2.js" /> "></script>
<link
	href=" <c:url value="/springResources/theme/lib/select2/select2.css" />"
	rel="stylesheet">
<script
	src="<c:url value="/springResources/serializejsonjs/serializejson.js" />"></script>
<link href="<c:url value="/springResources/admincss/toggleCss.css" />"
	rel="stylesheet">
<style>
html {
	overflow-y: scroll;
}

.bspace {
	margin-left: 0.5%;
}

.finput:read-only {
	background-color: white;
	padding: 0 10px
}
ul li ul li {
  padding-left: 5px;
  padding-right: 5px;
}
.bt {
	height: 28px;
	width: 38px;
}

td {
	vertical-align: middle;
}

.btn1, .btn-default {
	width: 100px !important;
}

.params {
	margin-top: 6px;
	border-radius: 3px;
	float: left;
}

table, th, td {
	border: 1px solid;
	padding: 10px;
	border-color: #87838969;
}
.file-area {
	border: 2px dashed #dadada;
	height: 50px;
	width: 100%;
	border-radius: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	background: #fff;
	cursor: pointer;
}

.drag-over {
	border: 2px solid #dadada;
}

#dynamic_url {
	text-transform: none;
}
</style>
</head>
<body class="skin-brown">
	<div id="loading">
		<img id="loading-image" src="../springResources/images/progress.gif"
			alt="Loading..." />
	</div>
	<div class="well">
		<div class="panel panel-primary">
			<div class="panel-heading">PV DATA</div>
			<div class="panel-body">
				<form:form method="post"
					action="${pageContext.request.contextPath}/administration/savepvdata.so"
					modelAttribute="WhatsAppTemplateBean" class="form-horizontal"
					role="form" id="WhatsAppTemplateBeanForm">
					<div class="row">
						<div class="container1">
							<fieldset>
								<legend>PV DATA</legend>
								<div class="row bspace">
									<div class="form-group row">
										<div class="row bspace">
											<div class="form-group row">
												<label class="control-label col-md-2 col-sm-3 col-xs-6"
													for="spltype" for="percentage">Choose<span
													style="color: red;"> *</span></label>
												<div class="col-md-7 col-sm-6 col-xs-12">
													<div class="btn-group btn-toggle">
														<button type="button" class="btn btn1 btn-primary active"
															name="brandInd" id="Kbrand"
															onclick="disbleTemplatefiels()">Main</button>
														<button type="button" class="btn btn1 btn-default "
															name="brandInd" id="Abrand"
															onclick="disbleTemplatefiels()">History</button>
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<label class="control-label col-md-2 col-sm-3 col-xs-6">PV
												Tables<span style="color: red;"> *</span>
											</label>
											<div class="col-md-3 col-sm-3 col-xs-6">
												<div class="dropdown-mul-1">
													<select id="wpdocument" class="form-control"
														onchange="handleDropdownChange();" style="width: 180px;">
														<option value="0" label="-- PLEASE SELECT --" />
														<c:forEach items="${DocumentList}" var="document">
															<option value="${document.documentId}">${document.documentDesc}</option>
														</c:forEach>
													</select>
													<div id="wpdocumentError"
														class="col-md-12 col-sm-12 col-xs-12"></div>
												</div>
											</div>

											<div class="col-md-2 col-sm-2 col-xs-6"
												style="margin-top: 2px;">
												<div class="dropdown-mul-1">
													<select id="operator" class="form-control"
														style="width: 130px;" onchange="handleOperatorChange();">
														<option value="ID">ID</option>
														<option value="TRANSDATETIME">TRANDATETIME</option>
													</select>
												</div>
											</div>
											<div class="col-md-2 col-sm-2 col-xs-6"
												style="margin-top: 2px;">
												<div class="dropdown-mul-1">
													<select id="transOperator" class="form-control"
														style="width: 100px;"></select>
												</div>
											</div>
											<div>
												<input type="text" id="inputBox" placeholder="ENTER">
											</div>


										</div>
									</div>
								</div>
								<div class="col-md-3 col-sm-3 col-xs-6"
									style="margin-top: 2px; text-align: center;">
									<!-- Search Button -->
									<button id="searchButton" class="btn btn-primary"
										style="width: 90px; margin-left: auto; margin-right: auto;">
										Search</button>
								</div>


							</fieldset>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>

	<div></div>
	<!-- 
	<script>
        function handleDropdownChange() {
            console.log("Dropdown changed!"); 
            var transOperatorDropdown = document.getElementById("transOperator");
            transOperatorDropdown.innerHTML = "";
        }

        function handleOperatorChange() {
            console.log("Operator Dropdown changed!"); 

            var operatorDropdown = document.getElementById("operator");
            var transOperatorDropdown = document.getElementById("transOperator");
            transOperatorDropdown.innerHTML = "";
			if (operatorDropdown.value === "ID") {
                addOption(transOperatorDropdown, "LIKE", "LIKE");
                transOperatorDropdown.value = "LIKE";
            } else if (operatorDropdown.value === "TRANSDATETIME") {
                addOption(transOperatorDropdown, "<", "<");
            }
        }

        function addOption(selectElement, value, text) {
            var option = document.createElement("option");
            option.value = value;
            option.text = text;
            selectElement.add(option);
        }
    </script> -->



	<script>
    function handleOperatorChange() {
        var operatorDropdown = document.getElementById("operator");
        var transOperatorDropdown = document.getElementById("transOperator");
		  transOperatorDropdown.innerHTML = "";
		 var selectedOperator = operatorDropdown.value;
		 if (selectedOperator === "ID") {
            var options = ["LIKE", "="];
            addOptionsToDropdown(options);
        } else if (selectedOperator === "TRANSDATETIME") {
            var options = ["<", ">", "<=", ">=", "="];
            addOptionsToDropdown(options);
        }
       
    }
	
    function addOptionsToDropdown(options) {
        var transOperatorDropdown = document.getElementById("transOperator");
        options.forEach(function (option) {
            var optionElement = document.createElement("option");
            optionElement.value = option;
            optionElement.text = option;
            //optionElement.style.fontWeight = "bold";
            transOperatorDropdown.add(optionElement);
        });
    }
</script>
</body>
</html>