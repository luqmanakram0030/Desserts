; ModuleID = 'obj/Debug/android/marshal_methods.x86.ll'
source_filename = "obj/Debug/android/marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android"


%struct.MonoImage = type opaque

%struct.MonoClass = type opaque

%struct.MarshalMethodsManagedClass = type {
	i32,; uint32_t token
	%struct.MonoClass*; MonoClass* klass
}

%struct.MarshalMethodName = type {
	i64,; uint64_t id
	i8*; char* name
}

%class._JNIEnv = type opaque

%class._jobject = type {
	i8; uint8_t b
}

%class._jclass = type {
	i8; uint8_t b
}

%class._jstring = type {
	i8; uint8_t b
}

%class._jthrowable = type {
	i8; uint8_t b
}

%class._jarray = type {
	i8; uint8_t b
}

%class._jobjectArray = type {
	i8; uint8_t b
}

%class._jbooleanArray = type {
	i8; uint8_t b
}

%class._jbyteArray = type {
	i8; uint8_t b
}

%class._jcharArray = type {
	i8; uint8_t b
}

%class._jshortArray = type {
	i8; uint8_t b
}

%class._jintArray = type {
	i8; uint8_t b
}

%class._jlongArray = type {
	i8; uint8_t b
}

%class._jfloatArray = type {
	i8; uint8_t b
}

%class._jdoubleArray = type {
	i8; uint8_t b
}

; assembly_image_cache
@assembly_image_cache = local_unnamed_addr global [0 x %struct.MonoImage*] zeroinitializer, align 4
; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = local_unnamed_addr constant [308 x i32] [
	i32 32687329, ; 0: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 73
	i32 34715100, ; 1: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 120
	i32 39109920, ; 2: Newtonsoft.Json.dll => 0x254c520 => 23
	i32 57263871, ; 3: Xamarin.Forms.Core.dll => 0x369c6ff => 112
	i32 101534019, ; 4: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 89
	i32 103834273, ; 5: Xamarin.Firebase.Annotations.dll => 0x63062a1 => 101
	i32 120558881, ; 6: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 89
	i32 134690465, ; 7: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 130
	i32 165246403, ; 8: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 49
	i32 182336117, ; 9: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 91
	i32 209399409, ; 10: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 47
	i32 220171995, ; 11: System.Diagnostics.Debug => 0xd1f8edb => 142
	i32 230216969, ; 12: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 67
	i32 232815796, ; 13: System.Web.Services => 0xde07cb4 => 140
	i32 261689757, ; 14: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 53
	i32 278686392, ; 15: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 71
	i32 280482487, ; 16: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 65
	i32 318968648, ; 17: Xamarin.AndroidX.Activity.dll => 0x13031348 => 38
	i32 321597661, ; 18: System.Numerics => 0x132b30dd => 32
	i32 342366114, ; 19: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 69
	i32 385762202, ; 20: System.Memory.dll => 0x16fe439a => 152
	i32 393699800, ; 21: Firebase => 0x177761d8 => 9
	i32 441335492, ; 22: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 52
	i32 442521989, ; 23: Xamarin.Essentials => 0x1a605985 => 100
	i32 442565967, ; 24: System.Collections => 0x1a61054f => 146
	i32 450948140, ; 25: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 64
	i32 459347974, ; 26: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 145
	i32 465846621, ; 27: mscorlib => 0x1bc4415d => 22
	i32 469710990, ; 28: System.dll => 0x1bff388e => 29
	i32 476646585, ; 29: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 65
	i32 485140951, ; 30: Xamarin.Google.Android.DataTransport.TransportRuntime => 0x1ceaa9d7 => 118
	i32 486930444, ; 31: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 77
	i32 495452658, ; 32: Xamarin.Google.Android.DataTransport.TransportRuntime.dll => 0x1d8801f2 => 118
	i32 507148113, ; 33: Xamarin.Google.Android.DataTransport.TransportApi.dll => 0x1e3a7751 => 116
	i32 526420162, ; 34: System.Transactions.dll => 0x1f6088c2 => 135
	i32 527452488, ; 35: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 130
	i32 539499754, ; 36: Desserts.Android => 0x20281cea => 0
	i32 542030372, ; 37: Xamarin.GooglePlayServices.Stats => 0x204eba24 => 124
	i32 545304856, ; 38: System.Runtime.Extensions => 0x2080b118 => 151
	i32 548916678, ; 39: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 20
	i32 605376203, ; 40: System.IO.Compression.FileSystem => 0x24154ecb => 138
	i32 610194910, ; 41: System.Reactive.dll => 0x245ed5de => 34
	i32 627609679, ; 42: Xamarin.AndroidX.CustomView => 0x2568904f => 58
	i32 639843206, ; 43: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 63
	i32 663517072, ; 44: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 96
	i32 666292255, ; 45: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 44
	i32 690569205, ; 46: System.Xml.Linq.dll => 0x29293ff5 => 37
	i32 691348768, ; 47: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 132
	i32 700284507, ; 48: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 127
	i32 720511267, ; 49: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 131
	i32 775507847, ; 50: System.IO.Compression => 0x2e394f87 => 30
	i32 809851609, ; 51: System.Drawing.Common.dll => 0x30455ad9 => 137
	i32 843511501, ; 52: Xamarin.AndroidX.Print => 0x3246f6cd => 84
	i32 846667644, ; 53: Xamarin.Firebase.Installations.dll => 0x32771f7c => 108
	i32 882434999, ; 54: Xamarin.Firebase.Installations.InterOp.dll => 0x3498e3b7 => 109
	i32 902159924, ; 55: Rg.Plugins.Popup => 0x35c5de34 => 25
	i32 928116545, ; 56: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 120
	i32 955402788, ; 57: Newtonsoft.Json => 0x38f24a24 => 23
	i32 956575887, ; 58: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 131
	i32 967690846, ; 59: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 69
	i32 974778368, ; 60: FormsViewGroup.dll => 0x3a19f000 => 11
	i32 992768348, ; 61: System.Collections.dll => 0x3b2c715c => 146
	i32 996733531, ; 62: Xamarin.Google.Android.DataTransport.TransportBackendCct => 0x3b68f25b => 117
	i32 1012816738, ; 63: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 88
	i32 1035644815, ; 64: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 43
	i32 1036359102, ; 65: Xamarin.GooglePlayServices.CloudMessaging.dll => 0x3dc595be => 123
	i32 1042160112, ; 66: Xamarin.Forms.Platform.dll => 0x3e1e19f0 => 114
	i32 1052210849, ; 67: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 74
	i32 1084122840, ; 68: Xamarin.Kotlin.StdLib => 0x409e66d8 => 129
	i32 1098259244, ; 69: System => 0x41761b2c => 29
	i32 1141947663, ; 70: Xamarin.Firebase.Measurement.Connector.dll => 0x4410bd0f => 110
	i32 1156995540, ; 71: Desserts.Android.dll => 0x44f659d4 => 0
	i32 1175144683, ; 72: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 94
	i32 1178241025, ; 73: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 81
	i32 1204270330, ; 74: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 44
	i32 1246548578, ; 75: Xamarin.AndroidX.Collection.Jvm.dll => 0x4a4cd262 => 50
	i32 1264511973, ; 76: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 90
	i32 1267360935, ; 77: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 95
	i32 1275534314, ; 78: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 132
	i32 1278448581, ; 79: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 41
	i32 1293217323, ; 80: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 60
	i32 1309284514, ; 81: Plugin.FirebasePushNotification => 0x4e0a18a2 => 24
	i32 1324164729, ; 82: System.Linq => 0x4eed2679 => 147
	i32 1333047053, ; 83: Xamarin.Firebase.Common => 0x4f74af0d => 102
	i32 1365406463, ; 84: System.ServiceModel.Internals.dll => 0x516272ff => 141
	i32 1376866003, ; 85: Xamarin.AndroidX.SavedState => 0x52114ed3 => 88
	i32 1379779777, ; 86: System.Resources.ResourceManager => 0x523dc4c1 => 4
	i32 1379897097, ; 87: Xamarin.JavaX.Inject => 0x523f8f09 => 126
	i32 1395857551, ; 88: Xamarin.AndroidX.Media.dll => 0x5333188f => 78
	i32 1406073936, ; 89: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 54
	i32 1457743152, ; 90: System.Runtime.Extensions.dll => 0x56e36530 => 151
	i32 1460219004, ; 91: Xamarin.Forms.Xaml => 0x57092c7c => 115
	i32 1461234159, ; 92: System.Collections.Immutable.dll => 0x5718a9ef => 27
	i32 1462112819, ; 93: System.IO.Compression.dll => 0x57261233 => 30
	i32 1469204771, ; 94: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 42
	i32 1479771757, ; 95: System.Collections.Immutable => 0x5833866d => 27
	i32 1531040989, ; 96: Xamarin.Firebase.Iid.Interop.dll => 0x5b41d4dd => 107
	i32 1543031311, ; 97: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 150
	i32 1550322496, ; 98: System.Reflection.Extensions.dll => 0x5c680b40 => 2
	i32 1580996379, ; 99: Google.Apis.Auth.PlatformServices => 0x5e3c171b => 15
	i32 1582372066, ; 100: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 59
	i32 1592978981, ; 101: System.Runtime.Serialization.dll => 0x5ef2ee25 => 6
	i32 1622152042, ; 102: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 76
	i32 1624863272, ; 103: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 98
	i32 1635184631, ; 104: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 63
	i32 1636350590, ; 105: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 57
	i32 1639515021, ; 106: System.Net.Http.dll => 0x61b9038d => 31
	i32 1639986890, ; 107: System.Text.RegularExpressions => 0x61c036ca => 150
	i32 1657153582, ; 108: System.Runtime => 0x62c6282e => 35
	i32 1658241508, ; 109: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 92
	i32 1658251792, ; 110: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 119
	i32 1670060433, ; 111: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 53
	i32 1698840827, ; 112: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 128
	i32 1701541528, ; 113: System.Diagnostics.Debug.dll => 0x656b7698 => 142
	i32 1726116996, ; 114: System.Reflection.dll => 0x66e27484 => 143
	i32 1729485958, ; 115: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 48
	i32 1765942094, ; 116: System.Reflection.Extensions => 0x6942234e => 2
	i32 1766324549, ; 117: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 91
	i32 1776026572, ; 118: System.Core.dll => 0x69dc03cc => 28
	i32 1788241197, ; 119: Xamarin.AndroidX.Fragment => 0x6a96652d => 64
	i32 1796167890, ; 120: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 20
	i32 1808609942, ; 121: Xamarin.AndroidX.Loader => 0x6bcd3296 => 76
	i32 1813058853, ; 122: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 129
	i32 1813201214, ; 123: Xamarin.Google.Android.Material => 0x6c13413e => 119
	i32 1818569960, ; 124: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 82
	i32 1867746548, ; 125: Xamarin.Essentials.dll => 0x6f538cf4 => 100
	i32 1878053835, ; 126: Xamarin.Forms.Xaml.dll => 0x6ff0d3cb => 115
	i32 1885316902, ; 127: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 45
	i32 1900610850, ; 128: System.Resources.ResourceManager.dll => 0x71490522 => 4
	i32 1904755420, ; 129: System.Runtime.InteropServices.WindowsRuntime.dll => 0x718842dc => 5
	i32 1908813208, ; 130: Xamarin.GooglePlayServices.Basement => 0x71c62d98 => 122
	i32 1919157823, ; 131: Xamarin.AndroidX.MultiDex.dll => 0x7264063f => 79
	i32 1933215285, ; 132: Xamarin.Firebase.Messaging.dll => 0x733a8635 => 111
	i32 1983156543, ; 133: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 128
	i32 2019465201, ; 134: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 74
	i32 2055257422, ; 135: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 70
	i32 2079903147, ; 136: System.Runtime.dll => 0x7bf8cdab => 35
	i32 2090596640, ; 137: System.Numerics.Vectors => 0x7c9bf920 => 33
	i32 2097448633, ; 138: Xamarin.AndroidX.Legacy.Support.Core.UI => 0x7d0486b9 => 66
	i32 2124230737, ; 139: Xamarin.Google.Android.DataTransport.TransportBackendCct.dll => 0x7e9d3051 => 117
	i32 2126786730, ; 140: Xamarin.Forms.Platform.Android => 0x7ec430aa => 113
	i32 2129483829, ; 141: Xamarin.GooglePlayServices.Base.dll => 0x7eed5835 => 121
	i32 2174878672, ; 142: Xamarin.Firebase.Annotations => 0x81a203d0 => 101
	i32 2201107256, ; 143: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 133
	i32 2201231467, ; 144: System.Net.Http => 0x8334206b => 31
	i32 2216717168, ; 145: Firebase.Auth.dll => 0x84206b70 => 8
	i32 2217644978, ; 146: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 94
	i32 2244775296, ; 147: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 77
	i32 2256548716, ; 148: Xamarin.AndroidX.MultiDex => 0x8680336c => 79
	i32 2261435625, ; 149: Xamarin.AndroidX.Legacy.Support.V4.dll => 0x86cac4e9 => 68
	i32 2279755925, ; 150: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 86
	i32 2315684594, ; 151: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 39
	i32 2354730003, ; 152: Syncfusion.Licensing => 0x8c5a5413 => 26
	i32 2403452196, ; 153: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 62
	i32 2409053734, ; 154: Xamarin.AndroidX.Preference.dll => 0x8f973e26 => 83
	i32 2454642406, ; 155: System.Text.Encoding.dll => 0x924edee6 => 149
	i32 2465532216, ; 156: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 52
	i32 2471841756, ; 157: netstandard.dll => 0x93554fdc => 1
	i32 2475788418, ; 158: Java.Interop.dll => 0x93918882 => 18
	i32 2483661569, ; 159: Xamarin.Firebase.Measurement.Connector => 0x9409ab01 => 110
	i32 2483742551, ; 160: Xamarin.Firebase.Messaging => 0x940ae757 => 111
	i32 2486410006, ; 161: Xamarin.GooglePlayServices.CloudMessaging => 0x94339b16 => 123
	i32 2486847491, ; 162: Google.Api.Gax => 0x943a4803 => 12
	i32 2501346920, ; 163: System.Data.DataSetExtensions => 0x95178668 => 136
	i32 2505896520, ; 164: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 73
	i32 2581819634, ; 165: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 95
	i32 2595928349, ; 166: FirebaseAdmin => 0x9abab91d => 10
	i32 2605712449, ; 167: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 133
	i32 2620111890, ; 168: Xamarin.Firebase.Encoders.dll => 0x9c2bbc12 => 105
	i32 2620871830, ; 169: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 57
	i32 2623491480, ; 170: Xamarin.Firebase.Installations.InterOp => 0x9c5f4d98 => 109
	i32 2624644809, ; 171: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 61
	i32 2629053246, ; 172: Google.Api.Gax.Rest => 0x9cb42b3e => 13
	i32 2633051222, ; 173: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 71
	i32 2639764100, ; 174: Xamarin.Firebase.Encoders => 0x9d579a84 => 105
	i32 2701096212, ; 175: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 92
	i32 2711384588, ; 176: Desserts => 0xa19c720c => 7
	i32 2715334215, ; 177: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2732626843, ; 178: Xamarin.AndroidX.Activity => 0xa2e0939b => 38
	i32 2737747696, ; 179: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 42
	i32 2766581644, ; 180: Xamarin.Forms.Core => 0xa4e6af8c => 112
	i32 2770495804, ; 181: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 127
	i32 2778768386, ; 182: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 97
	i32 2779977773, ; 183: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 87
	i32 2804607052, ; 184: Xamarin.Firebase.Components.dll => 0xa72ae84c => 103
	i32 2810250172, ; 185: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 54
	i32 2819470561, ; 186: System.Xml.dll => 0xa80db4e1 => 36
	i32 2821294376, ; 187: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 87
	i32 2847418871, ; 188: Xamarin.GooglePlayServices.Base => 0xa9b829f7 => 121
	i32 2853208004, ; 189: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 97
	i32 2855708567, ; 190: Xamarin.AndroidX.Transition => 0xaa36a797 => 93
	i32 2861816565, ; 191: Rg.Plugins.Popup.dll => 0xaa93daf5 => 25
	i32 2868557005, ; 192: Syncfusion.Licensing.dll => 0xaafab4cd => 26
	i32 2883826422, ; 193: Xamarin.Firebase.Installations => 0xabe3b2f6 => 108
	i32 2893550578, ; 194: Google.Apis.Core => 0xac7813f2 => 16
	i32 2901442782, ; 195: System.Reflection => 0xacf080de => 143
	i32 2903344695, ; 196: System.ComponentModel.Composition => 0xad0d8637 => 139
	i32 2905242038, ; 197: mscorlib.dll => 0xad2a79b6 => 22
	i32 2914202368, ; 198: Xamarin.Firebase.Iid.Interop => 0xadb33300 => 107
	i32 2916838712, ; 199: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 98
	i32 2919462931, ; 200: System.Numerics.Vectors.dll => 0xae037813 => 33
	i32 2921128767, ; 201: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 40
	i32 2978675010, ; 202: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 60
	i32 2990604888, ; 203: Google.Apis => 0xb2410258 => 17
	i32 2996846495, ; 204: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 72
	i32 3016983068, ; 205: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 90
	i32 3024354802, ; 206: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 67
	i32 3044182254, ; 207: FormsViewGroup => 0xb57288ee => 11
	i32 3057625584, ; 208: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 80
	i32 3058099980, ; 209: Xamarin.GooglePlayServices.Tasks => 0xb646e70c => 125
	i32 3071899978, ; 210: Xamarin.Firebase.Common.dll => 0xb719794a => 102
	i32 3075834255, ; 211: System.Threading.Tasks => 0xb755818f => 144
	i32 3106737866, ; 212: Xamarin.Firebase.Datatransport.dll => 0xb92d0eca => 104
	i32 3111772706, ; 213: System.Runtime.Serialization => 0xb979e222 => 6
	i32 3124832203, ; 214: System.Threading.Tasks.Extensions => 0xba4127cb => 3
	i32 3130021562, ; 215: Google.Apis.Auth.PlatformServices.dll => 0xba9056ba => 15
	i32 3155362983, ; 216: Xamarin.Google.Android.DataTransport.TransportApi => 0xbc1304a7 => 116
	i32 3203277885, ; 217: Google.Api.Gax.dll => 0xbeee243d => 12
	i32 3204380047, ; 218: System.Data.dll => 0xbefef58f => 134
	i32 3211777861, ; 219: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 59
	i32 3220365878, ; 220: System.Threading => 0xbff2e236 => 148
	i32 3230466174, ; 221: Xamarin.GooglePlayServices.Basement.dll => 0xc08d007e => 122
	i32 3247949154, ; 222: Mono.Security => 0xc197c562 => 153
	i32 3258312781, ; 223: Xamarin.AndroidX.CardView => 0xc235e84d => 48
	i32 3265893370, ; 224: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 3
	i32 3267021929, ; 225: Xamarin.AndroidX.AsyncLayoutInflater => 0xc2bacc69 => 46
	i32 3299363146, ; 226: System.Text.Encoding => 0xc4a8494a => 149
	i32 3317135071, ; 227: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 58
	i32 3317144872, ; 228: System.Data => 0xc5b79d28 => 134
	i32 3322403133, ; 229: Firebase.dll => 0xc607d93d => 9
	i32 3331531814, ; 230: Xamarin.GooglePlayServices.Stats.dll => 0xc6932426 => 124
	i32 3340431453, ; 231: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 45
	i32 3345895724, ; 232: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 85
	i32 3346324047, ; 233: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 81
	i32 3353484488, ; 234: Xamarin.AndroidX.Legacy.Support.Core.UI.dll => 0xc7e21cc8 => 66
	i32 3353544232, ; 235: Xamarin.CommunityToolkit.dll => 0xc7e30628 => 99
	i32 3362522851, ; 236: Xamarin.AndroidX.Core => 0xc86c06e3 => 56
	i32 3366347497, ; 237: Java.Interop => 0xc8a662e9 => 18
	i32 3374999561, ; 238: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 86
	i32 3383578424, ; 239: Xamarin.Firebase.Encoders.JSON => 0xc9ad4f38 => 106
	i32 3401559547, ; 240: Plugin.FirebasePushNotification.dll => 0xcabfadfb => 24
	i32 3404865022, ; 241: System.ServiceModel.Internals => 0xcaf21dfe => 141
	i32 3407215217, ; 242: Xamarin.CommunityToolkit => 0xcb15fa71 => 99
	i32 3429136800, ; 243: System.Xml => 0xcc6479a0 => 36
	i32 3430777524, ; 244: netstandard => 0xcc7d82b4 => 1
	i32 3441283291, ; 245: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 61
	i32 3453592554, ; 246: Google.Apis.Core.dll => 0xcdd9a3ea => 16
	i32 3476120550, ; 247: Mono.Android => 0xcf3163e6 => 21
	i32 3486566296, ; 248: System.Transactions => 0xcfd0c798 => 135
	i32 3493954962, ; 249: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 51
	i32 3501239056, ; 250: Xamarin.AndroidX.AsyncLayoutInflater.dll => 0xd0b0ab10 => 46
	i32 3509114376, ; 251: System.Xml.Linq => 0xd128d608 => 37
	i32 3536029504, ; 252: Xamarin.Forms.Platform.Android.dll => 0xd2c38740 => 113
	i32 3567349600, ; 253: System.ComponentModel.Composition.dll => 0xd4a16f60 => 139
	i32 3596207933, ; 254: LiteDB.dll => 0xd659c73d => 19
	i32 3608519521, ; 255: System.Linq.dll => 0xd715a361 => 147
	i32 3618140916, ; 256: Xamarin.AndroidX.Preference => 0xd7a872f4 => 83
	i32 3621458322, ; 257: Google.Api.Gax.Rest.dll => 0xd7db1192 => 13
	i32 3627220390, ; 258: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 84
	i32 3629588173, ; 259: LiteDB => 0xd8571ecd => 19
	i32 3632359727, ; 260: Xamarin.Forms.Platform => 0xd881692f => 114
	i32 3633644679, ; 261: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 40
	i32 3641597786, ; 262: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 70
	i32 3672681054, ; 263: Mono.Android.dll => 0xdae8aa5e => 21
	i32 3676310014, ; 264: System.Web.Services.dll => 0xdb2009fe => 140
	i32 3682565725, ; 265: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 47
	i32 3684561358, ; 266: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 51
	i32 3684933406, ; 267: System.Runtime.InteropServices.WindowsRuntime => 0xdba39f1e => 5
	i32 3689375977, ; 268: System.Drawing.Common => 0xdbe768e9 => 137
	i32 3706696989, ; 269: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 55
	i32 3718780102, ; 270: Xamarin.AndroidX.Annotation => 0xdda814c6 => 39
	i32 3724971120, ; 271: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 80
	i32 3731644420, ; 272: System.Reactive => 0xde6c6004 => 34
	i32 3758932259, ; 273: Xamarin.AndroidX.Legacy.Support.V4 => 0xe00cc123 => 68
	i32 3786282454, ; 274: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 49
	i32 3793997468, ; 275: Google.Apis.Auth.dll => 0xe223ce9c => 14
	i32 3822602673, ; 276: Xamarin.AndroidX.Media => 0xe3d849b1 => 78
	i32 3829621856, ; 277: System.Numerics.dll => 0xe4436460 => 32
	i32 3871172110, ; 278: Desserts.dll => 0xe6bd660e => 7
	i32 3885922214, ; 279: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 93
	i32 3888767677, ; 280: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 85
	i32 3896760992, ; 281: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 56
	i32 3910130544, ; 282: Xamarin.AndroidX.Collection.Jvm => 0xe90fdb70 => 50
	i32 3920810846, ; 283: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 138
	i32 3921031405, ; 284: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 96
	i32 3931092270, ; 285: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 82
	i32 3934056515, ; 286: Xamarin.JavaX.Inject.dll => 0xea7cf043 => 126
	i32 3945713374, ; 287: System.Data.DataSetExtensions.dll => 0xeb2ecede => 136
	i32 3955647286, ; 288: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 43
	i32 3959773229, ; 289: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 72
	i32 3970018735, ; 290: Xamarin.GooglePlayServices.Tasks.dll => 0xeca1adaf => 125
	i32 4015948917, ; 291: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 41
	i32 4024013275, ; 292: Firebase.Auth => 0xefd991db => 8
	i32 4025784931, ; 293: System.Memory => 0xeff49a63 => 152
	i32 4059682726, ; 294: Google.Apis.dll => 0xf1f9d7a6 => 17
	i32 4073602200, ; 295: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4082882467, ; 296: Google.Apis.Auth => 0xf35bd7a3 => 14
	i32 4101593132, ; 297: Xamarin.AndroidX.Emoji2 => 0xf479582c => 62
	i32 4105002889, ; 298: Mono.Security.dll => 0xf4ad5f89 => 153
	i32 4151237749, ; 299: System.Core => 0xf76edc75 => 28
	i32 4177102269, ; 300: FirebaseAdmin.dll => 0xf8f985bd => 10
	i32 4181436372, ; 301: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 145
	i32 4182413190, ; 302: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 75
	i32 4192648326, ; 303: Xamarin.Firebase.Encoders.JSON.dll => 0xf9e6bc86 => 106
	i32 4256097574, ; 304: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 55
	i32 4269159614, ; 305: Xamarin.Firebase.Datatransport => 0xfe7634be => 104
	i32 4284549794, ; 306: Xamarin.Firebase.Components => 0xff610aa2 => 103
	i32 4292120959 ; 307: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 75
], align 4
@assembly_image_cache_indices = local_unnamed_addr constant [308 x i32] [
	i32 73, i32 120, i32 23, i32 112, i32 89, i32 101, i32 89, i32 130, ; 0..7
	i32 49, i32 91, i32 47, i32 142, i32 67, i32 140, i32 53, i32 71, ; 8..15
	i32 65, i32 38, i32 32, i32 69, i32 152, i32 9, i32 52, i32 100, ; 16..23
	i32 146, i32 64, i32 145, i32 22, i32 29, i32 65, i32 118, i32 77, ; 24..31
	i32 118, i32 116, i32 135, i32 130, i32 0, i32 124, i32 151, i32 20, ; 32..39
	i32 138, i32 34, i32 58, i32 63, i32 96, i32 44, i32 37, i32 132, ; 40..47
	i32 127, i32 131, i32 30, i32 137, i32 84, i32 108, i32 109, i32 25, ; 48..55
	i32 120, i32 23, i32 131, i32 69, i32 11, i32 146, i32 117, i32 88, ; 56..63
	i32 43, i32 123, i32 114, i32 74, i32 129, i32 29, i32 110, i32 0, ; 64..71
	i32 94, i32 81, i32 44, i32 50, i32 90, i32 95, i32 132, i32 41, ; 72..79
	i32 60, i32 24, i32 147, i32 102, i32 141, i32 88, i32 4, i32 126, ; 80..87
	i32 78, i32 54, i32 151, i32 115, i32 27, i32 30, i32 42, i32 27, ; 88..95
	i32 107, i32 150, i32 2, i32 15, i32 59, i32 6, i32 76, i32 98, ; 96..103
	i32 63, i32 57, i32 31, i32 150, i32 35, i32 92, i32 119, i32 53, ; 104..111
	i32 128, i32 142, i32 143, i32 48, i32 2, i32 91, i32 28, i32 64, ; 112..119
	i32 20, i32 76, i32 129, i32 119, i32 82, i32 100, i32 115, i32 45, ; 120..127
	i32 4, i32 5, i32 122, i32 79, i32 111, i32 128, i32 74, i32 70, ; 128..135
	i32 35, i32 33, i32 66, i32 117, i32 113, i32 121, i32 101, i32 133, ; 136..143
	i32 31, i32 8, i32 94, i32 77, i32 79, i32 68, i32 86, i32 39, ; 144..151
	i32 26, i32 62, i32 83, i32 149, i32 52, i32 1, i32 18, i32 110, ; 152..159
	i32 111, i32 123, i32 12, i32 136, i32 73, i32 95, i32 10, i32 133, ; 160..167
	i32 105, i32 57, i32 109, i32 61, i32 13, i32 71, i32 105, i32 92, ; 168..175
	i32 7, i32 144, i32 38, i32 42, i32 112, i32 127, i32 97, i32 87, ; 176..183
	i32 103, i32 54, i32 36, i32 87, i32 121, i32 97, i32 93, i32 25, ; 184..191
	i32 26, i32 108, i32 16, i32 143, i32 139, i32 22, i32 107, i32 98, ; 192..199
	i32 33, i32 40, i32 60, i32 17, i32 72, i32 90, i32 67, i32 11, ; 200..207
	i32 80, i32 125, i32 102, i32 144, i32 104, i32 6, i32 3, i32 15, ; 208..215
	i32 116, i32 12, i32 134, i32 59, i32 148, i32 122, i32 153, i32 48, ; 216..223
	i32 3, i32 46, i32 149, i32 58, i32 134, i32 9, i32 124, i32 45, ; 224..231
	i32 85, i32 81, i32 66, i32 99, i32 56, i32 18, i32 86, i32 106, ; 232..239
	i32 24, i32 141, i32 99, i32 36, i32 1, i32 61, i32 16, i32 21, ; 240..247
	i32 135, i32 51, i32 46, i32 37, i32 113, i32 139, i32 19, i32 147, ; 248..255
	i32 83, i32 13, i32 84, i32 19, i32 114, i32 40, i32 70, i32 21, ; 256..263
	i32 140, i32 47, i32 51, i32 5, i32 137, i32 55, i32 39, i32 80, ; 264..271
	i32 34, i32 68, i32 49, i32 14, i32 78, i32 32, i32 7, i32 93, ; 272..279
	i32 85, i32 56, i32 50, i32 138, i32 96, i32 82, i32 126, i32 136, ; 280..287
	i32 43, i32 72, i32 125, i32 41, i32 8, i32 152, i32 17, i32 148, ; 288..295
	i32 14, i32 62, i32 153, i32 28, i32 10, i32 145, i32 75, i32 106, ; 296..303
	i32 55, i32 104, i32 103, i32 75 ; 304..307
], align 4

@marshal_methods_number_of_classes = local_unnamed_addr constant i32 0, align 4

; marshal_methods_class_cache
@marshal_methods_class_cache = global [0 x %struct.MarshalMethodsManagedClass] [
], align 4; end of 'marshal_methods_class_cache' array


@get_function_pointer = internal unnamed_addr global void (i32, i32, i32, i8**)* null, align 4

; Function attributes: "frame-pointer"="none" "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn writeonly
define void @xamarin_app_init (void (i32, i32, i32, i8**)* %fn) local_unnamed_addr #0
{
	store void (i32, i32, i32, i8**)* %fn, void (i32, i32, i32, i8**)** @get_function_pointer, align 4
	ret void
}

; Names of classes in which marshal methods reside
@mm_class_names = local_unnamed_addr constant [0 x i8*] zeroinitializer, align 4
@__MarshalMethodName_name.0 = internal constant [1 x i8] c"\00", align 1

; mm_method_names
@mm_method_names = local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	; 0
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		i8* getelementptr inbounds ([1 x i8], [1 x i8]* @__MarshalMethodName_name.0, i32 0, i32 0); name
	}
], align 8; end of 'mm_method_names' array


attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable willreturn writeonly "frame-pointer"="none" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" "stackrealign" }
attributes #1 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable "frame-pointer"="none" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" "stackrealign" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{!"Xamarin.Android remotes/origin/d17-5 @ 45b0e144f73b2c8747d8b5ec8cbd3b55beca67f0"}
!llvm.linker.options = !{}
