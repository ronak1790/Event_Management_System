<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testmaster.aspx.cs" Inherits="testmaster" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Event Management System</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="demo.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <script type="text/javascript" src="script.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <!--body start -->
    <div id="main">
        <!--left part start -->
        <div id="left">
            <img src="images/imagest.jpg" alt="goal" border="0" class="logo" title="goal" /></a>
            <ul>
                <li>
                    <img src="images/jewelry.jpg" alt="goal" border="0" class="logo" title="goal" /></li>
                <li>
                    <img src="images/press-conference.jpg" alt="goal" border="0" class="logo" title="goal" /></li>
                <li>
                    <img src="images/catering.jpg" alt="goal" border="0" class="logo" title="goal" />
                    </a></li>
            </ul>
            <br class="spacer" />
        </div>
        <!--left part end -->
        <!--mid part start -->
        <div id="mid">
            <ul class="midlink1">
                <h2 class="ser">
                    <a href="adminhome.aspx">Home</a></h2>
            </ul>
            <ul class="midlink1">
                <h2 class="ser">
                    Event</h2>
                <li><a href="admincategory.aspx">Category</a></li>
                <li><a href="adminsubcategory.aspx">Sub-Category</a></li>
            </ul>
            <ul class="midlink1">
                <h2 class="ser">
                    Item</h2>
                <li><a href="adminitem.aspx">Item</a></li>
                <li><a href="adminsubitem.aspx">Sub-Item</a></li>
            </ul>
            <ul class="midlink1">
                <h2 class="ser">
                    <a href="adminpackage.aspx">Package</a></h2>
            </ul>
            <ul class="midlink1">
                <h2 class="ser">
                    <a href="photogallary.aspx">Photo Gallary</a></h2>
            </ul>
            <ul class="midlink1">
                <h2 class="story">
                    News</h2>
                <marquee onmouseover="stop()" onmouseout="start()" direction="up" height="200" scrollamount="2">
            
            <p><strong> <asp:DataList ID="dl" runat="server" DataKeyField="news_id" RepeatColumns="1" RepeatDirection="Vertical">
            
            <ItemTemplate>
            <ul class="midlink3">
            
            <li><%# Eval("NewsDate") %></li>
            <li> <%# Eval("news_title") %><a href="newsdetail.aspx"><%# Eval("Description") %></a></li>
            
            </ul>                                               
            </ItemTemplate>
            </asp:DataList></strong>
            </p>
            </marquee>
            </ul>
            <br class="spacer" />
        </div>
        <!--mid part end -->
        <!--right part start -->
        <div id="right">
              <ul class="top">
                <li><a href="Home.aspx">Home</a></li>
                <li><a href="#">about</a></li>
                <li class="noMargin"><a href="clientlogin.aspx">Join Us </a></li>
            </ul>

            
<div id="main1">
    
        <div id="gallery1">
            <div id="slides1">
                <div class="slide1">
                    <img src="img/sample_slides/macbook.jpg" width="600" height="300" alt="side1" /></div>
                <div class="slide1">
                    <img src="img/sample_slides/iphone.jpg" width="600" height="300" alt="side1" /></div>
                <div class="slide1">
                    <img src="img/sample_slides/macbook.jpg" width="600" height="300" alt="side1" /></div>
                <div class="slide1">
                    <img src="img/sample_slides/imac.jpg" width="600" height="300" alt="side1" /></div>
                <div class="slide1">
                    <a href="http://tutorialzine.com/2009/10/beautiful-apple-gallery-slideshow/" target="_blank">
                        <img src="img/sample_slides/info.jpg" width="920" height="400" alt="side" /></a></div>
            </div>
            <div id="menu1">
                <ul>
                    <li class="fbar1">&nbsp;</li><li class="menuItem1"><a href="">
                        <img src="img/sample_slides/thumb_macbook.png" alt="thumbnail" /></a></li><li class="menuItem1">
                            <a href="">
                                <img src="img/sample_slides/thumb_iphone.jpg" alt="thumbnail" /></a></li><li class="menuItem1">
                                    <a href="">
                                        <img src="img/sample_slides/thumb_imac.png" alt="thumbnail" /></a></li><li class="menuItem1">
                                            <a href="">
                                                <img src="img/sample_slides/thumb_macbook.png" alt="thumbnail" /></a></li><li class="menuItem1">
                                                    <a href="">
                                                        <img src="img/sample_slides/thumb_about.png" alt="thumbnail" /></a></li>
                </ul>
            </div>
        </div>
</div>

















            <%--<asp:ContentPlaceHolder ID="ContentPlaceHolder1" runat="server">
            </asp:ContentPlaceHolder>--%>
        </div>
        <!--right part end -->
        <br class="spacer" />
    </div>
    <!--body end -->
    <!--footer start -->
    <div id="footerMain">
        <div id="footer">
            <ul>
                <li><a href="#">Wedding</a>| </li>
                <li><a href="#">Corporate</a>| </li>
                <li><a href="#">Meetings</a>| </li>
                <li><a href="#">Contact Us</a>| </li>
                <li><a href="#">Latest News And Events</a>| </li>
                <li><a href="#">Blogs</a>| </li>
                <li><a href="#">Client’s Testimonials</a></li>
            </ul>
            <p class="copyright">
                Copyright © Goal 2012. All Rights Reserved.</p>
            <p class="design">
                Designed by : <a href="http://www.templateworld.com/" target="_blank" class="link">Patel
                    Ronak</a></p>
        </div>
    </div>
    <!--footer end -->
    </form>
</body>
</html>