
					/*此处是网页计时器,到时自动提交数据*/
					function Timer(id) {
						this.id = id;
						this.timer = null;
						this.count = 0;
						this.begin = function(count) {
							this.count = count;
							Timer.show(this)();
							this.timer = setInterval(Timer.show(this), 1000);
						}

						Timer.show = function(obj) {
							return function() {
								if (obj.count == 7) {
									takemessage1();
								}else if(obj.count < 0){
									takemessage2();
									clearInterval(obj.timer);
									return;
								}
								document.getElementById(obj.id).innerHTML = "剩余时间："
										+ obj.count;
								obj.count--;
							}
						}
					}

					/*当计时器结束，触发事件*/
					function takemessage2() {
						document.getElementById("submit").click();
					}

					/*ajax对象处理*/
					function takemessage1() {
						if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
							xmlhttp = new XMLHttpRequest();
						} else {// code for IE6, IE5
							xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
						}
						xmlhttp.onreadystatechange = function() {
							if (xmlhttp.readyState == 4
									&& xmlhttp.status == 200) {
								document.getElementById("txtHint").innerHTML = xmlhttp.responseText;
								changeLabel();
								//alert(xmlhttp.responseText);
							}
						}
						xmlhttp.open("POST", "takemessage.jsp", true);
						xmlhttp.setRequestHeader("Content-type",
								"application/x-www-form-urlencoded");
						xmlhttp.send("answer=");
					}

					/*该方法是用来改变选项卡*/
					function changeLabel() {
						document.getElementById("#panel-3").href = "";
						document.getElementById("#panel-1").href = "";
						document.getElementById("#panel-2").href = "#panel-2";
						document.getElementById("#panel-4").href = "#panel-4";
						document.getElementById("#panel-2").click();
					}

					/*这个方法是用来获取选择题*/
					function getChoose() {
						var str = "";
						var topicId = document.getElementsByName("choose");
						for (var k = 0; k < topicId.length; k++) {
							var topic = document
									.getElementsByName("choose" + k);
							for (var i = 0; i < topic.length; i++) {
								if (topic[i].checked == true) {
									if (str == "") {
										str = topic[i].value;
									} else {
										str = str + "_" + topic[i].value;
									}
								}
							}
						}
						return str;
					}
					/*这个方法功能是用来获取作文的答案*/
					function getComposition() {
						return document.getElementById("composition");
					}

					/*这个方法是用来获取完型填空题答案*/
					function getBlank() {
						var str = "";
						var blanks = document.getElmentsByName("fill_blank");
						for (var i = 0; i < blanks.length; i++) {
							str = str + "_" + blacks[i].value;
						}
						return str;
					}

					/*这个方法是用来获取选择题*/
					function getRead() {
						var str = "";
						var topicId = document.getElementsByName("read");
						for (var k = 0; k < topicId.length; k++) {
							var topic = document.getElementsByName("read" + k);
							for (var i = 0; i < topic.length; i++) {
								if (topic[i].checked == true) {
									if (str == "") {
										str = topic[i].value;
									} else {
										str = str + "_" + topic[i].value;
									}
								}
							}
						}
						return str;
					}

					/*这个方法是用来获取翻译题答案*/
					function getTranslation() {
						return document.getElementById("translation");
					}
					t1 = new Timer("time");
					t1.begin(20);
