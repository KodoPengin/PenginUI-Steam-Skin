# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
#                                                               #
#      Additions to "library.css" & "steamui/css"               #
#      Ergänzungen für die "library.css" & "webkit.css"         #
#      Stand: 12.01.2021                                        #
#                                                               #
#      Folders:                                                 #
#      skins/PenginUI/resource/webkit.css                       #
#      steamui/css/library.css                                  #
#                                                               #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

/* Library.css - Hide activities | Aktivitäten ausblenden */
div.appdetailssection_AppDetailsSection_2r4TK.appdetailsactivitysection_ActivityFeedContainer_3yTl3, .appdetailssection_AppDetailsSection_2r4TK.appdetailscommunityfeed_CommunityContentContainer_A6G1l, .appactivityday_AppActivityDay_S2Fu9 {
	display:none !important;
}

/* Library.css - Hide DevNews/Advertising | Entwicklernews/Werbung ausblenden */
.appactivityday_AppActivityDay_S2Fu9 .appactivityday_AppActivityDate_19LfM, .appactivityday_Event_UVeN0 .appactivityday_PartnerEvent_1AYE1, .comment_thread_RatingBar_1yWgP { display: none !important; }

/* Library.css - Hide What's new? | Was ist neu? ausblenden */
.libraryhome_UpdatesContainer_17uEB { display:none; }

/* Library.css - Hide header | Headergrafiken ausblenden */
.appdetails_Header_2gZXh.appdetails_HeaderLoaded_tXlLv { opacity: 1; display: none; }

/* Webkit.css - Hide profile awards | Profilawards ausblenden */
div.profile_count_link_preview_ctn { visibility:hidden !important; }
div.profile_awards { display:none !important;}
div.profile_badges_badge { visibility:visible !important; margin-top:-40px !important; }
div.profile_group_links.profile_count_link_preview_ctn.responsive_groupfriends_element { visibility:visible !important; }
div.profile_friend_links.profile_count_link_preview_ctn.responsive_groupfriends_element { visibility:visible !important; }