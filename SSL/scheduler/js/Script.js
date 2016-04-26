Date.prototype.yyyymmddhhmm = function () {

    var yyyy = this.getFullYear().toString();
    var mm = (this.getMonth() + 1).toString();
    var dd = this.getDate().toString();
    var hh = this.getHours().toString();
    var min = this.getMinutes().toString();

    return yyyy + '-' + (mm[1] ? mm : "0" + mm[0]) + '-' + (dd[1] ? dd : "0" + dd[0]) + " " + (hh[1] ? hh : "0" + hh[0]) + ":" + (min[1] ? min : "0" + min[0]);
};

Date.prototype.yyyymmdd = function () {

    var yyyy = this.getFullYear().toString();
    var mm = (this.getMonth() + 1).toString();
    var dd = this.getDate().toString();
    var hh = this.getHours().toString();
    var min = this.getMinutes().toString();

    return yyyy + '-' + (mm[1] ? mm : "0" + mm[0]) + '-' + (dd[1] ? dd : "0" + dd[0]);
};

var sections = new Array();
var events = new Array();
var isViewChanged = false;
var eventRecord = 0;
var webServicePath = "http://52.35.20.44/webservicessched/scheduler.asmx";
//var webServicePath = "http://uat.jrgm.biz/jrgmSchdWebservice/scheduler.asmx";
//var webServicePath = "Scheduler/scheduler.asmx";
var ReportingID = $.cookie("EMPLOYEE_ID");

var CurrentStartDate = new Date().yyyymmdd();
var CurrentEndDate = new Date().yyyymmdd();

//var ReportingID = "1829";
//alert(ReportingID);
function Supervisors(data) {
    this.key = data.employee_ID;
    this.label = data.Crew_Name;
}

function Employees(data) {
    var jsStartDate = new Date(data.ReportDatestart).yyyymmddhhmm();
    var jsEndDate = new Date(data.ReportDateEnd).yyyymmddhhmm();
    var jsDbStartDate = new Date(data.start_Date).yyyymmdd();
    var jsDbEndDate = new Date(data.End_Date).yyyymmdd();
    this.id = data.id;
    this.emp_id = data.EmpID;
    this.text = data.Crew_Name;
    this.section_id = data.Crew_leader_ID;
    this.start_date = jsStartDate;
    this.end_date = jsEndDate;
    this.dbstart_date = jsDbStartDate;
    this.dbend_date = jsDbEndDate;
    this.appCrewID = data.appCrewID;
}
function init() {
scheduler.config.touch = "force";
    var oldEvent;

     var colorArray = [
        "my_event red",
        "my_event green",
        "my_event blue",
         "my_event maroon",         
         "my_event blueViolet",
        "my_event brown",
         "my_event violet",
		"my_event darkGoldenRod",
        "my_event darkKhaki",
        "my_event darkMagenta",
        "my_event deepSkyBlue",
		 "my_event orange",
        "my_event darkOliveGreen",
		 "my_event plum",
		"my_event aqua",
        "my_event greenYellow",
        "my_event hotPink",
        "my_event dimGray",
        "my_event gray",
        "my_event cyan",	
		 "my_event yellow",
         "my_event fuchsia",
         "my_event teal", 
		  "my_event chartreuse",
        "my_event coral",
    ];


    scheduler.locale.labels.unit_tab = "Crew"
    scheduler.locale.labels.section_custom = "Crew Leader";
    scheduler.locale.labels.section_time = "";
    scheduler.config.details_on_create = true;
    scheduler.config.details_on_dblclick = true;
    scheduler.config.dblclick_create = false;
    scheduler.config.xml_date = "%Y-%m-%d %H:%i";
    scheduler.config.buttons_right = [];
    scheduler.config.icons_select = [];
    scheduler.config.separate_short_events = true;
    scheduler.xy.min_event_height = 21;

    scheduler.filter_day = scheduler.filter_week = scheduler.filter_month = function (id, event) {
        if (event.section_id == sections[0].key) {
            return false;
        }
        return true;
    }

    scheduler.templates.event_class = function (start, end, event) {
        var returnValue = "";
        $.each(sections, function (key, value) {
            if (event.section_id == value.key) {
                returnValue = colorArray[key];
            }
        });
        return returnValue;
    };

    scheduler.renderEvent = function (container, ev) {
        var container_width = container.style.width;

        var html = "<div class='dhx_event_move my_event_move' style='width: " + container_width + "'></div>";

        html += "<div class='my_event_body  dhx_body'>";

        html += "<span>" + scheduler.templates.event_text(ev.start_date, ev.end_date, ev) + "</span>" + "</div>";

        html += "<div class='dhx_event_resize my_event_resize' style='width: " + container_width + "'></div>";

        container.innerHTML = html;
        return true;
    };

    scheduler.form_blocks["my_editor"] = {
        render: function () {
            return "<div style='height:80px;'>Start Date&nbsp;<input type='text' id='startDate' readonly='readonly' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;End Date&nbsp;<input type='text' id='endDate' readonly='readonly'/></div>";
        }
    };

    scheduler.attachEvent("onLightbox", function (event_id) {
        var event = this.getEvent(event_id);
        $("#startDate").datepicker({
            dateFormat: "yy-mm-dd",
            minDate: 0,
            changeMonth: true,
            changeYear: true,
            showOn: "button",
            buttonImage: "images/calendar.gif",
            buttonImageOnly: true
        });
        $("#endDate").datepicker({
            dateFormat: "yy-mm-dd",
            minDate: 0,
            changeMonth: true,
            changeYear: true,
            showOn: "button",
            buttonImage: "images/calendar.gif",
            buttonImageOnly: true
        });
        if (new Date(event.dbstart_date) < new Date(new Date().yyyymmdd())) {
            $('#startDate').datepicker().datepicker('disable');
        }
        if (event.readonly) {
            $('#startDate').datepicker().datepicker('disable');
            $('#endDate').datepicker().datepicker('disable');
        }
    });

    scheduler.attachEvent("onEventSave", function (id, data, flag) {
        if (confirm("Do you really want to edit the selected member to new dates?")) {
            $.blockUI();
            var event = this.getEvent(id);
            var returnValue = true;

            $.ajax({
                type: "POST",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                crossDomain: false,
                async: false,
                url: webServicePath + "/UpdateMapping",
                data: "{" +
                    "AppID: '274DCA9D-6ECE-4DB7-9FCA-71C27B7BDA06'" +
                    ",AppCrewID: '" + event.appCrewID + "'" +
                    ",EmployeeID: '" + event.emp_id + "'" +
                    ",CrewLeaderID: '" + event.section_id + "'" +
                    ",SupervisorID: '" + sections[0].key + "'" +
                    ",StartDate: '" + data.dbstart_date + "'" +
                    ",EndDate: '" + data.dbend_date + "'" +
                    ",BranchMangerID: '" + sections[0].key + "'" +
                    ",RequestDate: '" + event.start_date.yyyymmdd() + "'" +
                    "}",
                success: function (html) {
                    setTimeout(function () {
                        $.unblockUI();
                    }, 2000);
                    if (html.d.Message == "Failure") {
                        alert("Error in Saving Data!");
                        returnValue = false;

                    }
                    event.dbstart_date = data.dbstart_date;
                    event.dbend_date = data.dbend_date;
                    data.text = event.text;

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    setTimeout(function () {
                        $.unblockUI();
                    }, 2000);
                    alert(errorThrown);

                }
            });
            var currentScheduler_date = scheduler.getState().date.yyyymmdd();
            getData(currentScheduler_date, currentScheduler_date);
            scheduler.clearAll();
            scheduler.parse(events, "json");
            $.each(events, function (key, value) {
                if (value.section_id == sections[0].key) {
                    scheduler.getEvent(value.id).readonly = true;
                }
            });
            $(".dhx_cal_light").hide();
            $(".dhx_cal_cover").hide();
            setTimeout(function () {
                $.unblockUI();
            }, 2000);
        }
        return false;
    });

    scheduler.attachEvent("onBeforeDrag", function (event_id, mode, native_event_object) {
        if (event_id == null) {
            return false;
        }
        oldEvent = $.extend({}, this.getEvent(event_id));
        return true;
    });

    scheduler.attachEvent("onBeforeEventChanged", function (data, e, flag) {
        var returnValue = false;
	var CurrentDate = new Date(data.start_date.getFullYear(), data.start_date.getMonth(), data.start_date.getDate());
	if (new Date( CurrentDate.yyyymmdd()) < new Date(new Date().yyyymmdd())) {
            alert('Back date mapping is not allowed.');
		return false;
        }
        if (oldEvent.section_id == sections[0].key && oldEvent.section_id == data.section_id) {
            return false;
        }
        if (data.section_id == sections[0].key) {
            if (confirm("Do you really want to remove the selected member from selected date?")) {
                $.blockUI();
                var endDate = new Date(data.end_date.getFullYear(), data.end_date.getMonth(), data.end_date.getDate());
                endDate.setDate(endDate.getDate() - 1);
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    crossDomain: false,
                    async: false,
                    url: webServicePath + "/UpdateMapping",
                    data: "{" +
                        "AppID: '274DCA9D-6ECE-4DB7-9FCA-71C27B7BDA06'" +
                        ",AppCrewID: '" + data.appCrewID + "'" +
                        ",EmployeeID: '" + data.emp_id + "'" +
                        ",CrewLeaderID: '" + oldEvent.section_id + "'" +
                        ",SupervisorID: '" + sections[0].key + "'" +
                        ",StartDate: '" + oldEvent.start_date.yyyymmdd() + "'" +
                        ",EndDate: '" + endDate.yyyymmdd() + "'" +
                        ",BranchMangerID: '" + sections[0].key + "'" +
                        ",RequestDate: '" + oldEvent.start_date.yyyymmdd() + "'" +
                        "}",
                    success: function (html) {
                        setTimeout(function () {
                            $.unblockUI();
                        }, 2000);
                        if (html.d.Message == "Failure") {
                            alert("Error in Saving Data!");
                        }
			else {
                                        eventRecord++;
                                        scheduler.addEvent({
                                            id: eventRecord,
                                            emp_id: data.emp_id,
                                            appCrewID: data.emp_id ,
                                            start_date: data.start_date,
                                            end_date: data.end_date,
                                            text: data.text,
                                            section_id: data.section_id,
                                            dbstart_date: data.start_date,
                                            dbend_date: data.end_date
                                        });
                                    }
                        scheduler.deleteEvent(data.id);
						scheduler.refresh();
                        returnValue = false;
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        setTimeout(function () {
                            $.unblockUI();
                        }, 2000);
                        alert(errorThrown);
                    }
                });
            }
        }
        var evs = scheduler.getEvents();
        var duplicateFound = false;
        for (var i = 0; i < evs.length; i++) {
            if (evs[i].id != data.id) {
                if (data.text == evs[i].text && evs[i].section_id == data.section_id) {
                    duplicateFound = true;
                }
            }
        }
        if (duplicateFound) {
            return false;
        }
	
        if (oldEvent.section_id == sections[0].key) {
            if (confirm("Do you really want to assign the selected member from selected dateto the selected leader?")) {
                $.blockUI();
                var endDate = new Date(data.end_date.getFullYear(), data.end_date.getMonth(), data.end_date.getDate());
                endDate.setMonth(endDate.getMonth() + 15);
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    crossDomain: false,
                    async: false,
                    url: webServicePath + "/InsertMapping",
                    data: "{" +
                    "AppID: '274DCA9D-6ECE-4DB7-9FCA-71C27B7BDA06'" +
                    ",EmployeeID: '" + data.emp_id + "'" +
                    ",CrewLeaderID: '" + data.section_id + "'" +
                    ",SupervisorID: '" + sections[0].key + "'" +
                    ",StartDate: '" + data.start_date.yyyymmdd() + "'" +
                    ",EndDate: '" + endDate.yyyymmdd() + "'" +
                    ",BranchMangerID: '" + sections[0].key + "'" +
                    ",RequestDate: '" + data.start_date.yyyymmdd() + "'" +
                    "}",
                    success: function (html) {
                        setTimeout(function () {
                            $.unblockUI();
                        }, 2000);
                        if (html.d.Message == "Failure") {
                            alert("Error in Saving Data!");
                        }
                        else {
                            eventRecord++;
                            scheduler.addEvent({
                                id: eventRecord,
                                emp_id: data.emp_id,
                                appCrewID: html.d.CurrentRecord[0].ID,
                                start_date: data.start_date,
                                end_date: data.end_date,
                                text: data.text,
                                section_id: data.section_id,
                                dbstart_date: data.start_date.yyyymmdd(),
                                dbend_date: endDate.yyyymmdd()
                            });
                        }
						scheduler.refresh();
                        setTimeout(function () {
                            $.unblockUI();
                        }, 2000);
			scheduler.deleteEvent(data.id);
                        returnValue = false;
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        setTimeout(function () {
                            $.unblockUI();
                        }, 2000);
                        alert(errorThrown);
                    }
                });
            }
        }
        else {
            if (new Date(event.dbstart_date) < new Date(data.start_date.yyyymmdd())) {
                if (confirm("Do you really want to re-assign the selected member with selected leader?")) {
                    $.blockUI();
                    var endDate = new Date(data.end_date.getFullYear(), data.end_date.getMonth(), data.end_date.getDate());
                    endDate.setDate(endDate.getDate() - 1);
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        crossDomain: false,
                        async: false,
                        url: webServicePath + "/UpdateMapping",
                        data: "{" +
                        "AppID: '274DCA9D-6ECE-4DB7-9FCA-71C27B7BDA06'" +
                        ",AppCrewID: '" + oldEvent.appCrewID + "'" +
                        ",EmployeeID: '" + oldEvent.emp_id + "'" +
                        ",CrewLeaderID: '" + oldEvent.section_id + "'" +
                        ",SupervisorID: '" + sections[0].key + "'" +
                        ",StartDate: '" + oldEvent.start_date.yyyymmdd() + "'" +
                        ",EndDate: '" + endDate.yyyymmdd() + "'" +
                        ",BranchMangerID: '" + sections[0].key + "'" +
                        ",RequestDate: '" + oldEvent.start_date.yyyymmdd() + "'" +
                        "}",
                        success: function (html) {
                            setTimeout(function () {
                                $.unblockUI();
                            }, 2000);
                            if (html.d.Message == "Failure") {
                                alert("Error in Saving Data!");
                                returnValue = false;
                            }
                            var startDate = new Date(data.start_date.getFullYear(), data.start_date.getMonth(), data.start_date.getDate());
                            endDate = new Date(data.end_date.getFullYear(), data.end_date.getMonth(), data.end_date.getDate());
                            endDate.setMonth(endDate.getMonth() + 15);
                            $.ajax({
                                type: "POST",
                                dataType: "json",
                                contentType: "application/json; charset=utf-8",
                                crossDomain: false,
                                async: false,
                                url: webServicePath + "/InsertMapping",
                                data: "{" +
                                "AppID: '274DCA9D-6ECE-4DB7-9FCA-71C27B7BDA06'" +
                                ",EmployeeID: '" + data.emp_id + "'" +
                                ",CrewLeaderID: '" + data.section_id + "'" +
                                ",SupervisorID: '" + sections[0].key + "'" +
                                ",StartDate: '" + startDate.yyyymmdd() + "'" +
                                ",EndDate: '" + endDate.yyyymmdd() + "'" +
                                ",BranchMangerID: '" + sections[0].key + "'" +
                                ",RequestDate: '" + data.start_date.yyyymmdd() + "'" +
                                "}",
                                success: function (html) {
                                    setTimeout(function () {
                                        $.unblockUI();
                                    }, 2000);
                                    if (html.d.Message == "Failure") {
                                        alert("Error in Saving Data!");
                                    }
                                    else {
                                        eventRecord++;
                                        scheduler.addEvent({
                                            id: eventRecord,
                                            emp_id: data.emp_id,
                                            appCrewID: html.d.CurrentRecord[0].ID,
                                            start_date: data.start_date,
                                            end_date: data.end_date,
                                            text: data.text,
                                            section_id: data.section_id,
                                            dbstart_date: startDate.yyyymmdd(),
                                            dbend_date: endDate.yyyymmdd()
                                        });
                                    }
									scheduler.refresh();
                                    setTimeout(function () {
                                        $.unblockUI();
                                    }, 2000);
				
                                    returnValue = false;
                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    setTimeout(function () {
                                        $.unblockUI();
                                    }, 2000);
                                    alert(errorThrown);
                                }
                            });
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            setTimeout(function () {
                                $.unblockUI();
                            }, 2000);
                            alert(errorThrown);
                        }
                    });
                }
            }
            else {
		if (oldEvent.section_id == data.section_id)
			return false;
		else
		{
			if(data.section_id != sections[0].key)
			alert('To move an employee you must first move the employee to the leftmost column (Branch Manager or Supervisor) first and then move to the new column.');
		}
                /*if (confirm("Do you really want to re-assign the selected member with selected leader?")) {
                    $.blockUI();
                    var endDate = new Date(data.end_date.getFullYear(), data.end_date.getMonth(), data.end_date.getDate());
                    endDate.setMonth(endDate.getMonth() + 15);
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        crossDomain: false,
                        async: false,
                        url: webServicePath + "/UpdateMapping",
                        data: "{" +
                        "AppID: '274DCA9D-6ECE-4DB7-9FCA-71C27B7BDA06'" +
                        ",AppCrewID: '" + data.appCrewID + "'" +
                        ",EmployeeID: '" + data.emp_id + "'" +
                        ",CrewLeaderID: '" + data.section_id + "'" +
                        ",SupervisorID: '" + sections[0].key + "'" +
                        ",StartDate: '" + data.start_date.yyyymmdd() + "'" +
                        ",EndDate: '" + endDate.yyyymmdd() + "'" +
                        ",BranchMangerID: '" + sections[0].key + "'" +
                        ",RequestDate: '" + data.start_date.yyyymmdd() + "'" +
                        "}",
                        success: function (html) {
                            setTimeout(function () {
                                $.unblockUI();
                            }, 2000);
                            if (html.d.Message == "Failure") {
                                alert("Error in Saving Data!");
                                //returnValue = false;
                            }
                        else {
                            eventRecord++;
                            scheduler.addEvent({
                                id: eventRecord,
                                emp_id: data.emp_id,
                                appCrewID: html.d.CurrentRecord[0].ID,
                                start_date: data.start_date,
                                end_date: data.end_date,
                                text: data.text,
                                section_id: data.section_id,
                                dbstart_date: data.start_date.yyyymmdd(),
                                dbend_date: endDate.yyyymmdd()
                            });
                        }
                        setTimeout(function () {
                            $.unblockUI();
                        }, 2000);
			
                        returnValue = false;
                    },

                        error: function (jqXHR, textStatus, errorThrown) {
                            setTimeout(function () {
                                $.unblockUI();
                            }, 2000);
                            alert(errorThrown);
                        }
                    });
                }
		*/
            }
        }
        return returnValue;
    });

    scheduler.attachEvent("onViewChange", function (new_mode, new_date) {
        if (isViewChanged == true) {
            var startDate = new Date(), endDate = new Date();
            switch (new_mode) {
                case "day":
                    $.blockUI();
                    startDate = new Date(new_date).yyyymmdd();
                    endDate = new Date(new_date).yyyymmdd();
                    getData(startDate, endDate);
					CurrentStartDate = startDate;
					CurrentEndDate  =endDate;
                    scheduler.clearAll();
                    scheduler.parse(events, "json");
                    $.each(events, function (key, value) {
                        if (value.section_id == sections[0].key) {
                            scheduler.getEvent(value.id).readonly = true;
                        }
                    });
                    setTimeout(function () {
                        $(".dhx_scale_hour").text("");
                        $.unblockUI();
                    }, 2000);
                    break;
                case "month":
                    $.blockUI();
                    startDate = new Date(new Date(new_date).getFullYear(), new Date(new_date).getMonth(), 1).yyyymmdd();
                    endDate = new Date(new Date(new_date).getFullYear(), new Date(new_date).getMonth() + 1, 0).yyyymmdd();
                    getData(startDate, endDate);
					CurrentStartDate = startDate;
					CurrentEndDate  =endDate;
                    scheduler.clearAll();
                    scheduler.parse(events, "json");
                    $.each(events, function (key, value) {
                        if (value.section_id == sections[0].key) {
                            scheduler.getEvent(value.id).readonly = true;
                        }
                    });
                    setTimeout(function () {
                        $(".dhx_scale_hour").text("");
                        $.unblockUI();
                    }, 2000);
                    break;
                case "unit":
                    $.blockUI();
                    startDate = new Date(new_date).yyyymmdd();
                    endDate = new Date(new_date).yyyymmdd();
                    getData(startDate, endDate);
					CurrentStartDate = startDate;
					CurrentEndDate  =endDate;
                    scheduler.clearAll();
                    scheduler.parse(events, "json");
                    $.each(events, function (key, value) {
                        if (value.section_id == sections[0].key) {
                            scheduler.getEvent(value.id).readonly = true;
                        }
                    });
                    setTimeout(function () {
                        $(".dhx_scale_hour").text("");
                        $.unblockUI();
                    }, 2000);
                    break;
                case "week":
                    $.blockUI();
                    var curstartDate = new Date(new_date);
                    var curendDate = new Date(new_date);
                    var first = (curstartDate.getDate() - curstartDate.getDay()) + 1;
                    var last = first + 6;

                    startDate = new Date(curstartDate.setDate(first)).yyyymmdd();
                    endDate = new Date(curendDate.setDate(last)).yyyymmdd();
                    getData(startDate, endDate);
					CurrentStartDate = startDate;
					CurrentEndDate  =endDate;
                    scheduler.clearAll();
                    scheduler.parse(events, "json");
                    $.each(events, function (key, value) {
                        if (value.section_id == sections[0].key) {
                            scheduler.getEvent(value.id).readonly = true;
                        }
                    });
                    setTimeout(function () {
                        $(".dhx_scale_hour").text("");
                        $.unblockUI();
                    }, 2000);
                    break;
            }
        }
    });
    //$.blockUI();
    getData(new Date().yyyymmdd(), new Date().yyyymmdd());

    scheduler.config.lightbox.sections = [
                { name: "description", height: 200, map_to: "text", type: "textarea" },
                { name: "custom", height: 23, type: "select", options: sections, map_to: "section_id" },
                { name: "time", height: 200, map_to: "text", type: "my_editor" }
    ];

    scheduler.form_blocks.textarea.set_value = function (node, value, ev) {
        node.firstChild.value = value || "";
        node.firstChild.disabled = true;
    }


    scheduler.form_blocks.select.set_value = function (node, value, ev) {
        node.firstChild.value = value || "";
        node.firstChild.disabled = true;
    }

    scheduler.form_blocks.my_editor.set_value = function (node, value, ev) {
        $("#" + node.childNodes[1].id).val(ev.dbstart_date || "");
        $("#" + node.childNodes[3].id).val(ev.dbend_date || "");
    }

    scheduler.form_blocks.my_editor.get_value = function (node, ev) {
        ev.dbend_date = $("#" + node.childNodes[4].id).val();
        ev.dbstart_date = $("#" + node.childNodes[1].id).val();
    }

    scheduler.createUnitsView({
        name: "unit",
        property: "section_id",
        list: sections
    });
	
		scheduler.refresh = function(refresh_all) {
	   getRefreshData();
            scheduler.clearAll();
            scheduler.parse(events, "json");
            $.each(events, function (key, value) {
                if (value.section_id == sections[0].key) {
                    scheduler.getEvent(value.id).readonly = true;
                }
            });
};


    scheduler.config.multi_day = true;

    scheduler.init('scheduler_here', new Date(), "unit");
    scheduler.parse(events, "json");
    $.each(events, function (key, value) {
        if (value.section_id == sections[0].key) {
            scheduler.getEvent(value.id).readonly = true;
        }
    });
    isViewChanged = true;
    setTimeout(function () {
        $(".dhx_scale_hour").text("");
        $.unblockUI();
    }, 2000);
}


function getRefreshData() {
     $.blockUI();
       setTimeout(function () {
        
		 $.unblockUI();
    }, 100);
		  getData(CurrentStartDate, CurrentEndDate);
}

function getData(startDate, endDate) {

    $.ajax({
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        crossDomain: false,
        async: false,
        url: webServicePath + "/BranchEmployee",
        data: "{" +
            "AppID: '274DCA9D-6ECE-4DB7-9FCA-71C27B7BDA06'" +
            ",EmployeeID: '" + ReportingID + "'" +
            ",StartDate: '" + startDate + "'" +
            ",EndDate: '" + endDate + "'" +
            "}",
        success: function (html) {

            sections = new Array();
            $.each(html.d.Supervisor,
                function (key, item) {
                    sections.push(new Supervisors(item));
                });

            events = new Array();
            $.each(html.d.Employees,
                function (key, item) {
                    events.push(new Employees(item));
                });
            eventRecord = events.length;
        },
        error: function (jqXHR, textStatus, errorThrown) {


            alert(errorThrown);
        }
    });
}
