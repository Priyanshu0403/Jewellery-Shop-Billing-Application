<%@ page import="java.sql.*, java.util.*"%>
<%@ page import="com.ba.dao.connectDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Insert title here</title>
<link href="bootstrap.min.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap"
	rel="stylesheet">
<link href="navbar.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
	rel="stylesheet">

<style>
body {
	background-image: url('BackGroundImg.jpg');
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
	color: white;
}

.overlay {
	background-color: rgba(0, 0, 0, 0.6);
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.middlePart {
	display: flex;
}

.content {
	position: relative;
	z-index: 2;
	text-align: center;
	padding-top: 2vh;
}

/* SIDE BAR STYLING */
.row .col-md-2 {
	box-shadow: 0px 10px 10px #B98522;
	height: 100px;
}

.list-group a {
	background-color: transparent;
	color: white;
	height: 50px;
}

.list-group .active {
	color: #B98522;
	background-color: transparent !important;
	border: 0;
	font-size: x-large;
}

/*  side bar Styling end*/
form {
	color: black;
}
</style>
</head>
<body>
	<div class="overlay"></div>
	<%@include file="navbar.html"%>
	<div class="middlePart">
		<%@include file="sideBarDropDownMenu.html"%>
		<div class="container-fluid "
			style="margin-top: 80px; padding-left: 250px;">
			<div class="row">
				<div
					class="col col-md-12 pt-1 d-flex flex-column align-items-center"
					style="z-index: 2;">

					<h3 class="mb-1 text-center">Edit Purchase Details</h3>
					<div class="content">
						<div class="container">

							<%
							int purchaseId = Integer.parseInt(request.getParameter("id"));
							Connection conn = connectDB.getConnection();
							PreparedStatement ps = conn.prepareStatement("SELECT * FROM customer_purchases WHERE purchase_id=?");
							ps.setInt(1, purchaseId);
							ResultSet rs = ps.executeQuery();
							if (rs.next()) {
							%>

							<form action="updatePurchase" method="post"
								class="shadow p-4 bg-light rounded" style="width: 600px">

								<input type="hidden" name="customer_id"
									value="<%=rs.getInt("customer_id")%>" /> <input type="hidden"
									name="purchase_id" value="<%=rs.getInt("purchase_id")%>" />

								<div class="row">
									<div class="col-md-6 mb-2">
										<label class="form-label">Item Name:</label> <input
											class="form-control" type="text" name="item_name"
											value="<%=rs.getString("item_name")%>" required>
									</div>
									<div class="col-md-6 mb-2">
										<label class="form-label">Quantity:</label> <input
											class="form-control" type="number" name="quantity"
											value="<%=rs.getInt("quantity")%>" required>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 mb-2">
										<label class="form-label">Weight:</label> <input
											class="form-control" type="text" name="weight"
											value="<%=rs.getDouble("weight")%>" required>
									</div>

									<div class="col-md-6 mb-2">
										<label class="form-label">Price(in ₹):</label> <input
											class="form-control" type="text" name="price"
											value="<%=rs.getDouble("price")%>" required>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3 mb-2">
									</div>
									<div class="col-md-6 mb-2">
										<label class="form-label">Date:</label> <input
											class="form-control" type="date" name="date"
											value="<%=rs.getDate("purchase_date")%>" required>
									</div>
								</div>

								<input class="btn btn-success" type="submit"
									value="Update Purchase">
							</form>
							<%
							} else {
							out.println("Purchase record not found.");
							}
							rs.close();
							ps.close();
							conn.close();
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>