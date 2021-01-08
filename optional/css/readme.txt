# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
#                                                               #
#      Additions to "library.css" in folder "steamui/css"       #
#      Ergänzungen für die "library.css" & "webkit.css"         #
#      Stand: 07.01.2021                                        #
#                                                               #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

/* Library.css - Hide friend activities | Aktivitäten von Freunden ausblenden */
.appactivityday_AppActivityDay_S2Fu9 { display: none; }
.appdetailsactivitysection_ActivityFeedContainer_3yTl3 .appdetailsactivitysection_FetchMoreContainer_39Zur { display: none; }

/* Library.css - Hide community content | Communityinhalte ausblenden */
.appdetailscommunityfeed_InnerContainer_3Uy7t { display: none; }

/* Library.css - Hide DevNews/Advertising | Entwicklernews/Werbung ausblenden */
.appactivityday_AppActivityDay_S2Fu9 .appactivityday_AppActivityDate_19LfM, .appactivityday_Event_UVeN0 .appactivityday_PartnerEvent_1AYE1, .comment_thread_RatingBar_1yWgP { display: none !important; }

/* Library.css - Hide What's new? | Was ist neu? ausblenden */
.libraryhome_UpdatesContainer_17uEB { display:none; position: relative; }

/* Library.css - Hide header | Headergrafiken ausblenden */
.appdetails_Header_2gZXh.appdetails_HeaderLoaded_tXlLv { opacity: 1; display: none; }

/* Webkit.css - Hide profile awards | Profilawards ausblenden */
div.profile_count_link_preview_ctn { visibility:hidden !important; }
div.profile_awards { display:none !important;}
div.profile_badges_badge { visibility:visible !important; margin-top:-40px !important; }
div.profile_group_links.profile_count_link_preview_ctn.responsive_groupfriends_element { visibility:visible !important; }
div.profile_friend_links.profile_count_link_preview_ctn.responsive_groupfriends_element { visibility:visible !important; }