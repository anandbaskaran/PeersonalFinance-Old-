<%@include file="../includes/util.jsp"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%
	JSONObject portfolio_stock = new JSONObject();
	portfolio_stock = (JSONObject) request.getAttribute("portfolio_stock");
%>
<div class="row">
	<div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div class="tile-stats">
			<div class="count" style="font-size: 25px;"><%=formatINR((double) portfolio_stock.get("totalInv"))%></div>

			<h3 style="font-size: 18px;">Total Investments</h3>
		</div>
	</div>
	<div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div class="tile-stats">
			<div class="count" style="font-size: 25px;"><%=formatINR((double) portfolio_stock.get("presentVal"))%></div>

			<h3 style="font-size: 18px;">Present Value</h3>
		</div>
	</div>
	<div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div class="tile-stats">
			<div class="count" style="font-size: 25px;"><%=formatINR((double) portfolio_stock.get("profit"))%></div>

			<h3 style="font-size: 18px;">P&L</h3>
		</div>
	</div>
	<div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div class="tile-stats">
			<div class="count">xx%</div>

			<h3 style="font-size: 18px;">Portfolio Holding</h3>
		</div>
	</div>
</div>
<br>
<div class="row">
	<div class="col-md-4 col-sm-4 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					Investment Value <small>Stocks</small>
				</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"><i
							class="fa fa-wrench"></i></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Settings 1</a></li>
							<li><a href="#">Settings 2</a></li>
						</ul></li>
					<li><a class="close-link"><i class="fa fa-close"></i></a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<iframe class="chartjs-hidden-iframe"
					style="width: 100%; display: block; border: 0px; height: 0px; margin: 0px; position: absolute; left: 0px; right: 0px; top: 0px; bottom: 0px;"></iframe>
				<canvas id="canvasDoughnut" width="386" height="193"
					style="width: 386px; height: 193px;"></canvas>
			</div>
		</div>
	</div>
	<div class="col-md-4 col-sm-4 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					Current Value <small>Stocks</small>
				</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"><i
							class="fa fa-wrench"></i></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Settings 1</a></li>
							<li><a href="#">Settings 2</a></li>
						</ul></li>
					<li><a class="close-link"><i class="fa fa-close"></i></a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<iframe class="chartjs-hidden-iframe"
					style="width: 100%; display: block; border: 0px; height: 0px; margin: 0px; position: absolute; left: 0px; right: 0px; top: 0px; bottom: 0px;"></iframe>
				<canvas id="canvasDoughnut" width="386" height="193"
					style="width: 386px; height: 193px;"></canvas>
			</div>
		</div>
	</div>
	<div class="col-md-4 col-sm-4 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					Profit <small>Stocks</small>
				</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"><i
							class="fa fa-wrench"></i></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Settings 1</a></li>
							<li><a href="#">Settings 2</a></li>
						</ul></li>
					<li><a class="close-link"><i class="fa fa-close"></i></a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<iframe class="chartjs-hidden-iframe"
					style="width: 100%; display: block; border: 0px; height: 0px; margin: 0px; position: absolute; left: 0px; right: 0px; top: 0px; bottom: 0px;"></iframe>
				<canvas id="canvasDoughnut" width="386" height="193"
					style="width: 386px; height: 193px;"></canvas>
			</div>
		</div>
	</div>
</div>



<table id="stockTable"
	class="table table-striped table-bordered dt-responsive nowrap"
	cellspacing="0" width="100%">
	<thead>
		<tr>
			<th>Symbol</th>
			<th>Quantity</th>
			<th>Buy Avg</th>
			<th>LTP</th>
			<th>Present Value</th>
			<th>P&L</th>
			<th>Net Change</th>
		</tr>
	</thead>
	<tbody>
		<%
			JSONArray portfolio = (JSONArray) portfolio_stock.get("portfolio");

			for (int i = 0; i < portfolio.size(); i++) {
				JSONObject account = (JSONObject) portfolio.get(i);
		%>
		<tr>
			<td><%=account.get("Symbol")%></td>
			<td><%=account.get("Quantity")%></td>
			<td><%=formatINR((double) account.get("BuyAvg"))%></td>
			<td><%=formatINR((double) account.get("PreviousClossingPrice"))%></td>
			<td><%=formatINR((double) account.get("PresentValue"))%></td>
			<td><%=formatINR((double) account.get("Profit"))%></td>
			<td><%=formatPercentage((double) account.get("ProfitPercentage"))%></td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>
<div class="ln_solid"></div>
