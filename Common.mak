objects_sender   = $(objdir)Ohm.$(objext) \
                   $(objdir)OhmMsg.$(objext) \
                   $(objdir)OhmSender.$(objext) \
                   $(ohnetdir)DvAvOpenhomeOrgSender1.$(objext)

headers_sender   = Ohm.h \
                   OhmMsg.h \
                   OhmSender.h

objects_receiver = $(objdir)Ohm.$(objext) \
                   $(objdir)OhmMsg.$(objext) \
                   $(objdir)OhmReceiver.$(objext) \
				   $(objdir)OhmProtocolMulticast.$(objext) \
				   $(objdir)OhmProtocolUnicast.$(objext) \
                   $(ohnetdir)DvAvOpenhomeOrgReceiver1.$(objext)

headers_receiver = Ohm.h \
                   OhmMsg.h \
                   OhmReceiver.h

$(objdir)Ohm.$(objext) : Ohm.cpp Ohm.h
	$(compiler)Ohm.$(objext) -c $(cflags) $(includes) Ohm.cpp

$(objdir)OhmMsg.$(objext) : OhmMsg.cpp OhmMsg.h
	$(compiler)OhmMsg.$(objext) -c $(cflags) $(includes) OhmMsg.cpp

$(objdir)OhmSender.$(objext) : OhmSender.cpp OhmSender.h
	$(compiler)OhmSender.$(objext) -c $(cflags) $(includes) OhmSender.cpp

$(objdir)OhmReceiver.$(objext) : OhmReceiver.cpp OhmReceiver.h
	$(compiler)OhmReceiver.$(objext) -c $(cflags) $(includes) OhmReceiver.cpp

$(objdir)OhmProtocolMulticast.$(objext) : OhmProtocolMulticast.cpp OhmReceiver.h
	$(compiler)OhmProtocolMulticast.$(objext) -c $(cflags) $(includes) OhmProtocolMulticast.cpp

$(objdir)OhmProtocolUnicast.$(objext) : OhmProtocolUnicast.cpp OhmReceiver.h
	$(compiler)OhmProtocolUnicast.$(objext) -c $(cflags) $(includes) OhmProtocolUnicast.cpp

objects_topology = $(ohnetdir)CpTopology.$(objext) \
                   $(ohnetdir)CpTopology1.$(objext) \
                   $(ohnetdir)CpTopology2.$(objext) \
                   $(ohnetdir)CpTopology3.$(objext) \
                   $(ohnetdir)CpAvOpenhomeOrgProduct1.$(objext) \
                   $(ohnetdir)CpAvOpenhomeOrgVolume1.$(objext) \
                   $(ohnetdir)CpAvOpenhomeOrgReceiver1.$(objext) \
				   $(objdir)ReceiverManager1.$(objext) \
                   $(objdir)ReceiverManager2.$(objext) \
                   $(objdir)ReceiverManager3.$(objext)

headers_topology = ohSongcast$(dirsep)ReceiverManager1.h \
                   ohSongcast$(dirsep)ReceiverManager2.h \
                   ohSongcast$(dirsep)ReceiverManager3.h

$(objdir)ReceiverManager1.$(objext) : ohSongcast$(dirsep)ReceiverManager1.cpp $(headers_topology)
	$(compiler)ReceiverManager1.$(objext) -c $(cflags) $(includes) ohSongcast$(dirsep)ReceiverManager1.cpp

$(objdir)ReceiverManager2.$(objext) : ohSongcast$(dirsep)ReceiverManager2.cpp $(headers_topology)
	$(compiler)ReceiverManager2.$(objext) -c $(cflags) $(includes) ohSongcast$(dirsep)ReceiverManager2.cpp

$(objdir)ReceiverManager3.$(objext) : ohSongcast$(dirsep)ReceiverManager3.cpp $(headers_topology)
	$(compiler)ReceiverManager3.$(objext) -c $(cflags) $(includes) ohSongcast$(dirsep)ReceiverManager3.cpp


objects_songcast = $(objdir)Songcast.$(objext)

headers_songcast = ohSongcast$(dirsep)Songcast.h

$(objdir)Songcast.$(objext) : ohSongcast$(dirsep)Songcast.cpp $(headers_songcast) 
	$(compiler)Songcast.$(objext) -c $(cflags) $(includes) ohSongcast$(dirsep)Songcast.cpp


objects_netmon   = $(ohnetmondir)NetworkMonitor.$(objext) \
                   $(ohnetdir)DvAvOpenhomeOrgNetworkMonitor1.$(objext)


all_common : TestReceiverManager1 TestReceiverManager2 TestReceiverManager3 ZoneWatcher WavSender Receiver $(objdir)ohSongcast.net.dll $(objdir)TestSongcastCs.$(exeext)

TestReceiverManager1 : $(objdir)TestReceiverManager1.$(exeext) $(headers_topology)
$(objdir)TestReceiverManager1.$(exeext) : ohSongcast$(dirsep)TestReceiverManager1.cpp $(objects_topology)
	$(compiler)TestReceiverManager1.$(objext) -c $(cflags) $(includes) ohSongcast$(dirsep)TestReceiverManager1.cpp
	$(link) $(linkoutput)$(objdir)TestReceiverManager1.$(exeext) $(objdir)TestReceiverManager1.$(objext) $(objects_topology) $(ohnetdir)$(libprefix)ohNetCore.$(libext) $(ohnetdir)$(libprefix)TestFramework.$(libext)


TestReceiverManager2 : $(objdir)TestReceiverManager2.$(exeext) $(headers_topology)
$(objdir)TestReceiverManager2.$(exeext) : ohSongcast$(dirsep)TestReceiverManager2.cpp $(objects_topology)
	$(compiler)TestReceiverManager2.$(objext) -c $(cflags) $(includes) ohSongcast$(dirsep)TestReceiverManager2.cpp
	$(link) $(linkoutput)$(objdir)TestReceiverManager2.$(exeext) $(objdir)TestReceiverManager2.$(objext) $(objects_topology) $(ohnetdir)$(libprefix)ohNetCore.$(libext) $(ohnetdir)$(libprefix)TestFramework.$(libext)


TestReceiverManager3 : $(objdir)TestReceiverManager3.$(exeext) $(headers_topology)
$(objdir)TestReceiverManager3.$(exeext) : ohSongcast$(dirsep)TestReceiverManager3.cpp $(objects_topology)
	$(compiler)TestReceiverManager3.$(objext) -c $(cflags) $(includes) ohSongcast$(dirsep)TestReceiverManager3.cpp
	$(link) $(linkoutput)$(objdir)TestReceiverManager3.$(exeext) $(objdir)TestReceiverManager3.$(objext) $(objects_topology) $(ohnetdir)$(libprefix)ohNetCore.$(libext) $(ohnetdir)$(libprefix)TestFramework.$(libext)


ZoneWatcher : $(objdir)ZoneWatcher.$(exeext) $(headers_sender)
$(objdir)ZoneWatcher.$(exeext) : ZoneWatcher$(dirsep)ZoneWatcher.cpp $(objects_sender)
	$(compiler)ZoneWatcher.$(objext) -c $(cflags) $(includes) ZoneWatcher$(dirsep)ZoneWatcher.cpp
	$(link) $(linkoutput)$(objdir)ZoneWatcher.$(exeext) $(objdir)ZoneWatcher.$(objext) $(objects_sender) $(ohnetdir)$(libprefix)ohNetCore.$(libext) $(ohnetdir)$(libprefix)TestFramework.$(libext)


WavSender : $(objdir)WavSender.$(exeext) $(headers_sender)
$(objdir)WavSender.$(exeext) : WavSender$(dirsep)WavSender.cpp $(objects_sender)
	$(compiler)WavSender.$(objext) -c $(cflags) $(includes) WavSender$(dirsep)WavSender.cpp
	$(link) $(linkoutput)$(objdir)WavSender.$(exeext) $(objdir)WavSender.$(objext) $(objects_sender) $(ohnetdir)$(libprefix)ohNetCore.$(libext) $(ohnetdir)$(libprefix)TestFramework.$(libext)

Receiver : $(objdir)Receiver.$(exeext) $(headers_receiver)
$(objdir)Receiver.$(exeext) : Receiver$(dirsep)Receiver.cpp $(objects_receiver)
	$(compiler)Receiver.$(objext) -c $(cflags) $(includes) Receiver$(dirsep)Receiver.cpp
	$(link) $(linkoutput)$(objdir)Receiver.$(exeext) $(objdir)Receiver.$(objext) $(objects_receiver) $(ohnetdir)$(libprefix)ohNetCore.$(libext) $(ohnetdir)$(libprefix)TestFramework.$(libext)


$(objdir)ohSongcast.net.dll : $(objdir)$(dllprefix)ohSongcast.$(dllext) ohSongcast$(dirsep)Songcast.cs
	$(csharp) /unsafe /t:library \
		/out:$(objdir)ohSongcast.net.dll \
		ohSongcast$(dirsep)Songcast.cs

$(objdir)TestSongcastCs.$(exeext) : $(objdir)ohSongcast.net.dll ohSongcast$(dirsep)TestSongcastCs.cs
	$(csharp) /target:exe /debug+ \
		/out:$(objdir)TestSongcastCs.$(exeext) \
		/reference:System.dll \
		/reference:System.Net.dll \
		/reference:$(objdir)ohSongcast.net.dll \
		ohSongcast$(dirsep)TestSongcastCs.cs

