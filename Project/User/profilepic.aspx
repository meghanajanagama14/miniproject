<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.master" AutoEventWireup="true" CodeFile="profilepic.aspx.cs" Inherits="User_profilepic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <html>

<head>
	<meta charset="utf-8">
	<title>Daily UI - Day 1 Sign In</title>

	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="../css/animate.css">
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="../css/style.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>

<body>
    <form id="Form1" runat="server">
	<div class="container" style="margin-left:120px">
		<div class="login-box animated fadeInUp">
            <div class="box-header">
				<h2>Change Profile Picture</h2>
			</div>
            <br />
            <br />
			<label for="username">Upload Photo</label>
			<br/>
            <asp:FileUpload ID="FileUpload1" runat="server" />			
            <br/>
			<br/>
            <asp:Button ID="btnchange" BackColor="#FF5252" ForeColor="White" runat="server" Text="Upload" OnClick="btnSignup_Click" />
			<a href="Signup.aspx"><p class="small" style="color:black;font-size:15px">New User?</p></a>
                
		</div>
        
	</div>
        </form>
</body>


</html>
</asp:Content>

