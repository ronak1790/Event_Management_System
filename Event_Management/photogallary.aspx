<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true"
    CodeFile="photogallary.aspx.cs" Inherits="photogallary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" href="css/lightbox.css" type="text/css" media="screen" />

    <script src="js/prototype.js" type="text/javascript"></script>

    <script src="js/scriptaculous.js?load=effects,builder" type="text/javascript"></script>

    <script src="js/lightbox.js" type="text/javascript"></script>

    <h2 class="about">
        Photo Gallary..!!
    </h2>
    <div class="contact_areas">
        <div class="contactMain">
            <!--conten-area start-->
            <div id="content-area" class="alignright">
                <div id="banner">
                    <div class="cont-text">
                        <p>
                            <table border="0" width="100%">
                                <tr>
                                    <td align="center">
                                        <div id="Div7" style="overflow-x: auto; overflow-y: auto; width: 100%; height: 475px;"
                                            class="thinBorder">
                                            <asp:DataList ID="dl" runat="server" DataKeyField="PKPhotoId" RepeatColumns="2" RepeatDirection="Vertical">
                                                <ItemTemplate>
                                                    <table cellpadding="8" cellspacing="8" border="1" align="center" style="border-color: Gray;
                                                        border-style: solid; border-width: 1px;">
                                                        <tr>
                                                            <td valign="top">
                                                                <a href='<%# Eval("IFilename","../COLDFIRE/Gallery/{0}") %>' rel="lightbox[roadtrip]">
                                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("TFilename","~/Gallery/{0}")%>'
                                                                        ToolTip='<%# Eval("Description") %>' />
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </div>
                                        <%-- <asp:SqlDataSource ID="PhotoDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT [PKPhotoId], [Filename], [FKCategoryId], [Memo] FROM [Photo] WHERE ([FKCategoryId] = 1) order by memo">
                            </asp:SqlDataSource>--%>
                                    </td>
                                </tr>
                            </table>
                        </p>
                    </div>
                </div>
                <!--conten-area end-->
                <div class="alignnone">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
