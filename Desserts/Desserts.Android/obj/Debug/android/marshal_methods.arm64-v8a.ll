; ModuleID = 'obj/Debug/android/marshal_methods.arm64-v8a.ll'
source_filename = "obj/Debug/android/marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android"


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
@assembly_image_cache = local_unnamed_addr global [0 x %struct.MonoImage*] zeroinitializer, align 8
; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = local_unnamed_addr constant [308 x i64] [
	i64 24362543149721218, ; 0: Xamarin.AndroidX.DynamicAnimation => 0x568d9a9a43a682 => 61
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 21
	i64 210515253464952879, ; 2: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 49
	i64 232391251801502327, ; 3: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 88
	i64 233177144301842968, ; 4: Xamarin.AndroidX.Collection.Jvm.dll => 0x33c696097d9f218 => 50
	i64 263803244706540312, ; 5: Rg.Plugins.Popup.dll => 0x3a937a743542b18 => 25
	i64 295915112840604065, ; 6: Xamarin.AndroidX.SlidingPaneLayout => 0x41b4d3a3088a9a1 => 89
	i64 316157742385208084, ; 7: Xamarin.AndroidX.Core.Core.Ktx.dll => 0x46337caa7dc1b14 => 55
	i64 464346026994987652, ; 8: System.Reactive.dll => 0x671b04057e67284 => 34
	i64 634308326490598313, ; 9: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x8cd840fee8b6ba9 => 73
	i64 687654259221141486, ; 10: Xamarin.GooglePlayServices.Base => 0x98b09e7c92917ee => 121
	i64 702024105029695270, ; 11: System.Drawing.Common => 0x9be17343c0e7726 => 137
	i64 718159679911342543, ; 12: FirebaseAdmin.dll => 0x9f76a6c851fb1cf => 10
	i64 720058930071658100, ; 13: Xamarin.AndroidX.Legacy.Support.Core.UI => 0x9fe29c82844de74 => 66
	i64 872800313462103108, ; 14: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 60
	i64 940822596282819491, ; 15: System.Transactions => 0xd0e792aa81923a3 => 135
	i64 996343623809489702, ; 16: Xamarin.Forms.Platform => 0xdd3b93f3b63db26 => 114
	i64 1000557547492888992, ; 17: Mono.Security.dll => 0xde2b1c9cba651a0 => 153
	i64 1120440138749646132, ; 18: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 119
	i64 1315114680217950157, ; 19: Xamarin.AndroidX.Arch.Core.Common.dll => 0x124039d5794ad7cd => 44
	i64 1425944114962822056, ; 20: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 6
	i64 1465843056802068477, ; 21: Xamarin.Firebase.Components.dll => 0x1457b87e6928f7fd => 103
	i64 1624659445732251991, ; 22: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 42
	i64 1628611045998245443, ; 23: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 75
	i64 1636321030536304333, ; 24: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0x16b5614ec39e16cd => 67
	i64 1731380447121279447, ; 25: Newtonsoft.Json => 0x18071957e9b889d7 => 23
	i64 1743969030606105336, ; 26: System.Memory.dll => 0x1833d297e88f2af8 => 152
	i64 1795316252682057001, ; 27: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 43
	i64 1836611346387731153, ; 28: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 88
	i64 1837131419302612636, ; 29: Xamarin.Google.Android.DataTransport.TransportBackendCct.dll => 0x197ecd4ad53dce9c => 117
	i64 1865037103900624886, ; 30: Microsoft.Bcl.AsyncInterfaces => 0x19e1f15d56eb87f6 => 20
	i64 1875917498431009007, ; 31: Xamarin.AndroidX.Annotation.dll => 0x1a08990699eb70ef => 39
	i64 1981742497975770890, ; 32: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 74
	i64 1986553961460820075, ; 33: Xamarin.CommunityToolkit => 0x1b91a84d8004686b => 99
	i64 2040001226662520565, ; 34: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 3
	i64 2064708342624596306, ; 35: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x1ca7514c5eecb152 => 130
	i64 2133195048986300728, ; 36: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 23
	i64 2136356949452311481, ; 37: Xamarin.AndroidX.MultiDex.dll => 0x1da5dd539d8acbb9 => 79
	i64 2165725771938924357, ; 38: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 47
	i64 2262844636196693701, ; 39: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 60
	i64 2284400282711631002, ; 40: System.Web.Services => 0x1fb3d1f42fd4249a => 140
	i64 2304837677853103545, ; 41: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0x1ffc6da80d5ed5b9 => 87
	i64 2329709569556905518, ; 42: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 70
	i64 2470498323731680442, ; 43: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 54
	i64 2479423007379663237, ; 44: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 94
	i64 2497223385847772520, ; 45: System.Runtime => 0x22a7eb7046413568 => 35
	i64 2547086958574651984, ; 46: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 38
	i64 2592350477072141967, ; 47: System.Xml.dll => 0x23f9e10627330e8f => 36
	i64 2624866290265602282, ; 48: mscorlib.dll => 0x246d65fbde2db8ea => 22
	i64 2694427813909235223, ; 49: Xamarin.AndroidX.Preference.dll => 0x256487d230fe0617 => 83
	i64 2787234703088983483, ; 50: Xamarin.AndroidX.Startup.StartupRuntime => 0x26ae3f31ef429dbb => 90
	i64 2812926542227278819, ; 51: Google.Apis.Core.dll => 0x270985c960b98be3 => 16
	i64 2960931600190307745, ; 52: Xamarin.Forms.Core => 0x2917579a49927da1 => 112
	i64 3017704767998173186, ; 53: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 119
	i64 3143515969535650208, ; 54: Xamarin.Firebase.Encoders => 0x2ba0031e85f0a9a0 => 105
	i64 3289520064315143713, ; 55: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 69
	i64 3303437397778967116, ; 56: Xamarin.AndroidX.Annotation.Experimental => 0x2dd82acf985b2a4c => 40
	i64 3311221304742556517, ; 57: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 33
	i64 3344514922410554693, ; 58: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 133
	i64 3364695309916733813, ; 59: Xamarin.Firebase.Common => 0x2eb1cc8eb5028175 => 102
	i64 3411255996856937470, ; 60: Xamarin.GooglePlayServices.Basement => 0x2f5737416a942bfe => 122
	i64 3493805808809882663, ; 61: Xamarin.AndroidX.Tracing.Tracing.dll => 0x307c7ddf444f3427 => 92
	i64 3522470458906976663, ; 62: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 91
	i64 3531994851595924923, ; 63: System.Numerics => 0x31042a9aade235bb => 32
	i64 3571415421602489686, ; 64: System.Runtime.dll => 0x319037675df7e556 => 35
	i64 3716579019761409177, ; 65: netstandard.dll => 0x3393f0ed5c8c5c99 => 1
	i64 3727469159507183293, ; 66: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 86
	i64 3772598417116884899, ; 67: Xamarin.AndroidX.DynamicAnimation.dll => 0x345af645b473efa3 => 61
	i64 3775669193061889094, ; 68: Desserts => 0x3465df2071d6f446 => 7
	i64 3966267475168208030, ; 69: System.Memory => 0x370b03412596249e => 152
	i64 4009997192427317104, ; 70: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 145
	i64 4056584864658557221, ; 71: Google.Apis.Auth => 0x384be27113330925 => 14
	i64 4201423742386704971, ; 72: Xamarin.AndroidX.Core.Core.Ktx => 0x3a4e74a233da124b => 55
	i64 4239882675311405204, ; 73: Xamarin.Firebase.Encoders.JSON => 0x3ad716d44f44e894 => 106
	i64 4247996603072512073, ; 74: Xamarin.GooglePlayServices.Tasks => 0x3af3ea6755340049 => 125
	i64 4335356748765836238, ; 75: Xamarin.Google.Android.DataTransport.TransportBackendCct => 0x3c2a47fe48c7b3ce => 117
	i64 4525561845656915374, ; 76: System.ServiceModel.Internals => 0x3ece06856b710dae => 141
	i64 4636684751163556186, ; 77: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 96
	i64 4702770163853758138, ; 78: Xamarin.Firebase.Components => 0x4143988c34cf0eba => 103
	i64 4759461199762736555, ; 79: Xamarin.AndroidX.Lifecycle.Process.dll => 0x420d00be961cc5ab => 72
	i64 4782108999019072045, ; 80: Xamarin.AndroidX.AsyncLayoutInflater.dll => 0x425d76cc43bb0a2d => 46
	i64 4794310189461587505, ; 81: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 38
	i64 4795410492532947900, ; 82: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 91
	i64 5081566143765835342, ; 83: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 4
	i64 5099468265966638712, ; 84: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 4
	i64 5142919913060024034, ; 85: Xamarin.Forms.Platform.Android.dll => 0x475f52699e39bee2 => 113
	i64 5203618020066742981, ; 86: Xamarin.Essentials => 0x4836f704f0e652c5 => 100
	i64 5205316157927637098, ; 87: Xamarin.AndroidX.LocalBroadcastManager => 0x483cff7778e0c06a => 77
	i64 5348796042099802469, ; 88: Xamarin.AndroidX.Media => 0x4a3abda9415fc165 => 78
	i64 5376510917114486089, ; 89: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 94
	i64 5408338804355907810, ; 90: Xamarin.AndroidX.Transition => 0x4b0e477cea9840e2 => 93
	i64 5446034149219586269, ; 91: System.Diagnostics.Debug => 0x4b94333452e150dd => 142
	i64 5451019430259338467, ; 92: Xamarin.AndroidX.ConstraintLayout.dll => 0x4ba5e94a845c2ce3 => 53
	i64 5507995362134886206, ; 93: System.Core.dll => 0x4c705499688c873e => 28
	i64 5574231584441077149, ; 94: Xamarin.AndroidX.Annotation.Jvm => 0x4d5ba617ae5f8d9d => 41
	i64 5665389054145784248, ; 95: Google.Apis.Core => 0x4e9f815406bee9b8 => 16
	i64 5692067934154308417, ; 96: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 98
	i64 5757522595884336624, ; 97: Xamarin.AndroidX.Concurrent.Futures.dll => 0x4fe6d44bd9f885f0 => 51
	i64 5814345312393086621, ; 98: Xamarin.AndroidX.Preference => 0x50b0b44182a5c69d => 83
	i64 5896680224035167651, ; 99: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x51d5376bfbafdda3 => 71
	i64 6085203216496545422, ; 100: Xamarin.Forms.Platform.dll => 0x5472fc15a9574e8e => 114
	i64 6086316965293125504, ; 101: FormsViewGroup.dll => 0x5476f10882baef80 => 11
	i64 6092862891035488599, ; 102: Xamarin.Firebase.Measurement.Connector.dll => 0x548e32849d547157 => 110
	i64 6218967553231149354, ; 103: Firebase.Auth.dll => 0x564e360a4805d92a => 8
	i64 6319713645133255417, ; 104: Xamarin.AndroidX.Lifecycle.Runtime => 0x57b42213b45b52f9 => 73
	i64 6401687960814735282, ; 105: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 70
	i64 6504860066809920875, ; 106: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 47
	i64 6548213210057960872, ; 107: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 58
	i64 6554405243736097249, ; 108: Xamarin.GooglePlayServices.Stats => 0x5af5ecd7aad901e1 => 124
	i64 6591024623626361694, ; 109: System.Web.Services.dll => 0x5b7805f9751a1b5e => 140
	i64 6659513131007730089, ; 110: Xamarin.AndroidX.Legacy.Support.Core.UI.dll => 0x5c6b57e8b6c3e1a9 => 66
	i64 6876862101832370452, ; 111: System.Xml.Linq => 0x5f6f85a57d108914 => 37
	i64 6878582369430612696, ; 112: Xamarin.Google.Android.DataTransport.TransportRuntime.dll => 0x5f75a238802d2ad8 => 118
	i64 6894844156784520562, ; 113: System.Numerics.Vectors => 0x5faf683aead1ad72 => 33
	i64 6934772601320367100, ; 114: Google.Api.Gax.Rest => 0x603d42f05bcfe3fc => 13
	i64 6941080589610463230, ; 115: Google.Apis.Auth.PlatformServices => 0x6053ac0555172ffe => 15
	i64 6975328107116786489, ; 116: Xamarin.Firebase.Annotations => 0x60cd57f4e07e7339 => 101
	i64 7036436454368433159, ; 117: Xamarin.AndroidX.Legacy.Support.V4.dll => 0x61a671acb33d5407 => 68
	i64 7103753931438454322, ; 118: Xamarin.AndroidX.Interpolator.dll => 0x62959a90372c7632 => 65
	i64 7141577505875122296, ; 119: System.Runtime.InteropServices.WindowsRuntime.dll => 0x631bfae7659b5878 => 5
	i64 7270811800166795866, ; 120: System.Linq => 0x64e71ccf51a90a5a => 147
	i64 7338192458477945005, ; 121: System.Reflection => 0x65d67f295d0740ad => 143
	i64 7385250113861300937, ; 122: Xamarin.Firebase.Iid.Interop.dll => 0x667dadd98e1db2c9 => 107
	i64 7476537270401454554, ; 123: Xamarin.Firebase.Encoders.JSON.dll => 0x67c1ff08f83f51da => 106
	i64 7488575175965059935, ; 124: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 37
	i64 7602111570124318452, ; 125: System.Reactive => 0x698020320025a6f4 => 34
	i64 7635363394907363464, ; 126: Xamarin.Forms.Core.dll => 0x69f6428dc4795888 => 112
	i64 7637365915383206639, ; 127: Xamarin.Essentials.dll => 0x69fd5fd5e61792ef => 100
	i64 7654504624184590948, ; 128: System.Net.Http => 0x6a3a4366801b8264 => 31
	i64 7735352534559001595, ; 129: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 129
	i64 7820441508502274321, ; 130: System.Data => 0x6c87ca1e14ff8111 => 134
	i64 7836164640616011524, ; 131: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 42
	i64 7904570928025870493, ; 132: Xamarin.Firebase.Installations => 0x6db2ad60fadca09d => 108
	i64 7940488133782528123, ; 133: Xamarin.GooglePlayServices.CloudMessaging => 0x6e3247e31d4fe07b => 123
	i64 7969431548154767168, ; 134: Xamarin.Firebase.Installations.dll => 0x6e991bc4e98e6740 => 108
	i64 8044118961405839122, ; 135: System.ComponentModel.Composition => 0x6fa2739369944712 => 139
	i64 8064050204834738623, ; 136: System.Collections.dll => 0x6fe942efa61731bf => 146
	i64 8083354569033831015, ; 137: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 69
	i64 8103644804370223335, ; 138: System.Data.DataSetExtensions.dll => 0x7075ee03be6d50e7 => 136
	i64 8113615946733131500, ; 139: System.Reflection.Extensions => 0x70995ab73cf916ec => 2
	i64 8167236081217502503, ; 140: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 18
	i64 8185542183669246576, ; 141: System.Collections => 0x7198e33f4794aa70 => 146
	i64 8187640529827139739, ; 142: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 132
	i64 8290740647658429042, ; 143: System.Runtime.Extensions => 0x730ea0b15c929a72 => 151
	i64 8398329775253868912, ; 144: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x748cdc6f3097d170 => 52
	i64 8400357532724379117, ; 145: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 82
	i64 8426919725312979251, ; 146: Xamarin.AndroidX.Lifecycle.Process => 0x74f26ed7aa033133 => 72
	i64 8465511506719290632, ; 147: Xamarin.Firebase.Messaging.dll => 0x757b89dcf7fc3508 => 111
	i64 8518412311883997971, ; 148: System.Collections.Immutable => 0x76377add7c28e313 => 27
	i64 8598790081731763592, ; 149: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x77550a055fc61d88 => 63
	i64 8601935802264776013, ; 150: Xamarin.AndroidX.Transition.dll => 0x7760370982b4ed4d => 93
	i64 8626175481042262068, ; 151: Java.Interop => 0x77b654e585b55834 => 18
	i64 8639588376636138208, ; 152: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 81
	i64 8684531736582871431, ; 153: System.IO.Compression.FileSystem => 0x7885a79a0fa0d987 => 138
	i64 8702320156596882678, ; 154: Firebase.dll => 0x78c4da1357adccf6 => 9
	i64 8844506025403580595, ; 155: Plugin.FirebasePushNotification => 0x7abdff5eb1fb80b3 => 24
	i64 8853378295825400934, ; 156: Xamarin.Kotlin.StdLib.Common.dll => 0x7add84a720d38466 => 128
	i64 8951477988056063522, ; 157: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0x7c3a09cd9ccf5e22 => 85
	i64 9057635389615298436, ; 158: LiteDB => 0x7db32f65bf06d784 => 19
	i64 9296667808972889535, ; 159: LiteDB.dll => 0x8104661dcca35dbf => 19
	i64 9312692141327339315, ; 160: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 98
	i64 9324707631942237306, ; 161: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 43
	i64 9659729154652888475, ; 162: System.Text.RegularExpressions => 0x860e407c9991dd9b => 150
	i64 9662334977499516867, ; 163: System.Numerics.dll => 0x8617827802b0cfc3 => 32
	i64 9678050649315576968, ; 164: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 54
	i64 9704315356731487263, ; 165: Plugin.FirebasePushNotification.dll => 0x86aca766ba59341f => 24
	i64 9711637524876806384, ; 166: Xamarin.AndroidX.Media.dll => 0x86c6aadfd9a2c8f0 => 78
	i64 9774216967140627647, ; 167: Xamarin.Firebase.Datatransport.dll => 0x87a4fe8bac0354bf => 104
	i64 9796610708422913120, ; 168: Xamarin.Firebase.Iid.Interop => 0x87f48d88de55ec60 => 107
	i64 9808709177481450983, ; 169: Mono.Android.dll => 0x881f890734e555e7 => 21
	i64 9825649861376906464, ; 170: Xamarin.AndroidX.Concurrent.Futures => 0x885bb87d8abc94e0 => 51
	i64 9834056768316610435, ; 171: System.Transactions.dll => 0x8879968718899783 => 135
	i64 9875200773399460291, ; 172: Xamarin.GooglePlayServices.Base.dll => 0x890bc2c8482339c3 => 121
	i64 9907349773706910547, ; 173: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x897dfa20b758db53 => 63
	i64 9998632235833408227, ; 174: Mono.Security => 0x8ac2470b209ebae3 => 153
	i64 10038780035334861115, ; 175: System.Net.Http.dll => 0x8b50e941206af13b => 31
	i64 10144742755892837524, ; 176: Firebase => 0x8cc95dc98eb5bc94 => 9
	i64 10218821437939648382, ; 177: Google.Apis.Auth.PlatformServices.dll => 0x8dd08bf4c78a077e => 15
	i64 10220684565739810458, ; 178: FirebaseAdmin => 0x8dd72a76063d2e9a => 10
	i64 10226222362177979215, ; 179: Xamarin.Kotlin.StdLib.Jdk7 => 0x8dead70ebbc6434f => 130
	i64 10229024438826829339, ; 180: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 58
	i64 10321854143672141184, ; 181: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 127
	i64 10352330178246763130, ; 182: Xamarin.Firebase.Measurement.Connector => 0x8faadd72b7f4627a => 110
	i64 10360651442923773544, ; 183: System.Text.Encoding => 0x8fc86d98211c1e68 => 149
	i64 10376576884623852283, ; 184: Xamarin.AndroidX.Tracing.Tracing => 0x900101b2f888c2fb => 92
	i64 10406448008575299332, ; 185: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 133
	i64 10430153318873392755, ; 186: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 56
	i64 10447083246144586668, ; 187: Microsoft.Bcl.AsyncInterfaces.dll => 0x90fb7edc816203ac => 20
	i64 10714184849103829812, ; 188: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 151
	i64 10823124638835005028, ; 189: Google.Api.Gax.dll => 0x963376840189d664 => 12
	i64 10847732767863316357, ; 190: Xamarin.AndroidX.Arch.Core.Common => 0x968ae37a86db9f85 => 44
	i64 11019817191295005410, ; 191: Xamarin.AndroidX.Annotation.Jvm.dll => 0x98ee415998e1b2e2 => 41
	i64 11023048688141570732, ; 192: System.Core => 0x98f9bc61168392ac => 28
	i64 11037814507248023548, ; 193: System.Xml => 0x992e31d0412bf7fc => 36
	i64 11122995063473561350, ; 194: Xamarin.CommunityToolkit.dll => 0x9a5cd113fcc3df06 => 99
	i64 11162124722117608902, ; 195: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 97
	i64 11171845786728836392, ; 196: Xamarin.GooglePlayServices.CloudMessaging.dll => 0x9b0a5e8d536aad28 => 123
	i64 11299661109949763898, ; 197: Xamarin.AndroidX.Collection.Jvm => 0x9cd075e94cda113a => 50
	i64 11336891506707244397, ; 198: Xamarin.Firebase.Datatransport => 0x9d54bac28a6da56d => 104
	i64 11340910727871153756, ; 199: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 57
	i64 11376351552967644903, ; 200: Xamarin.Firebase.Annotations.dll => 0x9de0eb76829996e7 => 101
	i64 11392833485892708388, ; 201: Xamarin.AndroidX.Print.dll => 0x9e1b79b18fcf6824 => 84
	i64 11529969570048099689, ; 202: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 97
	i64 11578238080964724296, ; 203: Xamarin.AndroidX.Legacy.Support.V4 => 0xa0ae2a30c4cd8648 => 68
	i64 11580057168383206117, ; 204: Xamarin.AndroidX.Annotation => 0xa0b4a0a4103262e5 => 39
	i64 11591352189662810718, ; 205: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0xa0dcc167234c525e => 90
	i64 11597940890313164233, ; 206: netstandard => 0xa0f429ca8d1805c9 => 1
	i64 11672361001936329215, ; 207: Xamarin.AndroidX.Interpolator => 0xa1fc8e7d0a8999ff => 65
	i64 11743665907891708234, ; 208: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 144
	i64 12123043025855404482, ; 209: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 2
	i64 12137774235383566651, ; 210: Xamarin.AndroidX.VectorDrawable => 0xa872095bbfed113b => 95
	i64 12201331334810686224, ; 211: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 145
	i64 12269460666702402136, ; 212: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 27
	i64 12346958216201575315, ; 213: Xamarin.JavaX.Inject.dll => 0xab593514a5491b93 => 126
	i64 12437742355241350664, ; 214: Google.Apis.dll => 0xac9bbcc62bfdb608 => 17
	i64 12451044538927396471, ; 215: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 64
	i64 12466513435562512481, ; 216: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 76
	i64 12487638416075308985, ; 217: Xamarin.AndroidX.DocumentFile.dll => 0xad4d00fa21b0bfb9 => 59
	i64 12528155905152483962, ; 218: Firebase.Auth => 0xaddcf36b3153827a => 8
	i64 12538491095302438457, ; 219: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 48
	i64 12550732019250633519, ; 220: System.IO.Compression => 0xae2d28465e8e1b2f => 30
	i64 12700543734426720211, ; 221: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 49
	i64 12722065664929968482, ; 222: Google.Api.Gax.Rest.dll => 0xb08ddb515f583162 => 13
	i64 12828192437253469131, ; 223: Xamarin.Kotlin.StdLib.Jdk8.dll => 0xb206e50e14d873cb => 131
	i64 12854524964145442905, ; 224: Xamarin.Firebase.Encoders.dll => 0xb26472594447b059 => 105
	i64 12958614573187252691, ; 225: Google.Apis => 0xb3d63f4bf006c1d3 => 17
	i64 12963446364377008305, ; 226: System.Drawing.Common.dll => 0xb3e769c8fd8548b1 => 137
	i64 13129914918964716986, ; 227: Xamarin.AndroidX.Emoji2.dll => 0xb636d40db3fe65ba => 62
	i64 13370592475155966277, ; 228: System.Runtime.Serialization => 0xb98de304062ea945 => 6
	i64 13401370062847626945, ; 229: Xamarin.AndroidX.VectorDrawable.dll => 0xb9fb3b1193964ec1 => 95
	i64 13404347523447273790, ; 230: Xamarin.AndroidX.ConstraintLayout.Core => 0xba05cf0da4f6393e => 52
	i64 13454009404024712428, ; 231: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 120
	i64 13465488254036897740, ; 232: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 129
	i64 13491513212026656886, ; 233: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0xbb3b7bc905569876 => 45
	i64 13572454107664307259, ; 234: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 86
	i64 13647894001087880694, ; 235: System.Data.dll => 0xbd670f48cb071df6 => 134
	i64 13782512541859110153, ; 236: Google.Apis.Auth.dll => 0xbf45522249e0dd09 => 14
	i64 13828521679616088467, ; 237: Xamarin.Kotlin.StdLib.Common => 0xbfe8c733724e1993 => 128
	i64 13829530607229561650, ; 238: Xamarin.Firebase.Installations.InterOp => 0xbfec5cd0b64f6b32 => 109
	i64 13959074834287824816, ; 239: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 64
	i64 13967638549803255703, ; 240: Xamarin.Forms.Platform.Android => 0xc1d70541e0134797 => 113
	i64 13970307180132182141, ; 241: Syncfusion.Licensing => 0xc1e0805ccade287d => 26
	i64 14124974489674258913, ; 242: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 48
	i64 14125464355221830302, ; 243: System.Threading.dll => 0xc407bafdbc707a9e => 148
	i64 14172845254133543601, ; 244: Xamarin.AndroidX.MultiDex => 0xc4b00faaed35f2b1 => 79
	i64 14261073672896646636, ; 245: Xamarin.AndroidX.Print => 0xc5e982f274ae0dec => 84
	i64 14327695147300244862, ; 246: System.Reflection.dll => 0xc6d632d338eb4d7e => 143
	i64 14486659737292545672, ; 247: Xamarin.AndroidX.Lifecycle.LiveData => 0xc90af44707469e88 => 71
	i64 14495724990987328804, ; 248: Xamarin.AndroidX.ResourceInspection.Annotation => 0xc92b2913e18d5d24 => 87
	i64 14524915121004231475, ; 249: Xamarin.JavaX.Inject => 0xc992dd58a4283b33 => 126
	i64 14538127318538747197, ; 250: Syncfusion.Licensing.dll => 0xc9c1cdc518e77d3d => 26
	i64 14644440854989303794, ; 251: Xamarin.AndroidX.LocalBroadcastManager.dll => 0xcb3b815e37daeff2 => 77
	i64 14789919016435397935, ; 252: Xamarin.Firebase.Common.dll => 0xcd4058fc2f6d352f => 102
	i64 14792063746108907174, ; 253: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 120
	i64 14809388726477333247, ; 254: Xamarin.GooglePlayServices.Stats.dll => 0xcd8584954e5b22ff => 124
	i64 14852515768018889994, ; 255: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 57
	i64 14987728460634540364, ; 256: System.IO.Compression.dll => 0xcfff1ba06622494c => 30
	i64 14988210264188246988, ; 257: Xamarin.AndroidX.DocumentFile => 0xd000d1d307cddbcc => 59
	i64 15133485256822086103, ; 258: System.Linq.dll => 0xd204f0a9127dd9d7 => 147
	i64 15150743910298169673, ; 259: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xd2424150783c3149 => 85
	i64 15279429628684179188, ; 260: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 132
	i64 15363271389339872399, ; 261: Desserts.Android.dll => 0xd5354dee35866c8f => 0
	i64 15370334346939861994, ; 262: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 56
	i64 15526743539506359484, ; 263: System.Text.Encoding.dll => 0xd77a12fc26de2cbc => 149
	i64 15582737692548360875, ; 264: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 75
	i64 15609085926864131306, ; 265: System.dll => 0xd89e9cf3334914ea => 29
	i64 15777549416145007739, ; 266: Xamarin.AndroidX.SlidingPaneLayout.dll => 0xdaf51d99d77eb47b => 89
	i64 15810740023422282496, ; 267: Xamarin.Forms.Xaml => 0xdb6b08484c22eb00 => 115
	i64 15817206913877585035, ; 268: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 144
	i64 15930129725311349754, ; 269: Xamarin.GooglePlayServices.Tasks.dll => 0xdd1330956f12f3fa => 125
	i64 15940770867973848259, ; 270: Desserts.dll => 0xdd38fea58779fcc3 => 7
	i64 15963349826457351533, ; 271: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 3
	i64 16154507427712707110, ; 272: System => 0xe03056ea4e39aa26 => 29
	i64 16423015068819898779, ; 273: Xamarin.Kotlin.StdLib.Jdk8 => 0xe3ea453135e5c19b => 131
	i64 16467346005009053642, ; 274: Xamarin.Google.Android.DataTransport.TransportApi => 0xe487c3f19e0337ca => 116
	i64 16565028646146589191, ; 275: System.ComponentModel.Composition.dll => 0xe5e2cdc9d3bcc207 => 139
	i64 16621146507174665210, ; 276: Xamarin.AndroidX.ConstraintLayout => 0xe6aa2caf87dedbfa => 53
	i64 16677317093839702854, ; 277: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 82
	i64 16822611501064131242, ; 278: System.Data.DataSetExtensions => 0xe975ec07bb5412aa => 136
	i64 16833383113903931215, ; 279: mscorlib => 0xe99c30c1484d7f4f => 22
	i64 16866861824412579935, ; 280: System.Runtime.InteropServices.WindowsRuntime => 0xea132176ffb5785f => 5
	i64 16890310621557459193, ; 281: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 150
	i64 16955525858597485057, ; 282: Google.Api.Gax => 0xeb4e20ef25a73a01 => 12
	i64 17024911836938395553, ; 283: Xamarin.AndroidX.Annotation.Experimental.dll => 0xec44a31d250e5fa1 => 40
	i64 17031351772568316411, ; 284: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 80
	i64 17037200463775726619, ; 285: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xec704b8e0a78fc1b => 67
	i64 17285063141349522879, ; 286: Rg.Plugins.Popup => 0xefe0e158cc55fdbf => 25
	i64 17305153495539856329, ; 287: Desserts.Android => 0xf028416ae54333c9 => 0
	i64 17434242208926550937, ; 288: Xamarin.Google.Android.DataTransport.TransportRuntime => 0xf1f2deeb1f304b99 => 118
	i64 17544493274320527064, ; 289: Xamarin.AndroidX.AsyncLayoutInflater => 0xf37a8fada41aded8 => 46
	i64 17677828421478984182, ; 290: Xamarin.Firebase.Installations.InterOp.dll => 0xf5544349c68f29f6 => 109
	i64 17685921127322830888, ; 291: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 142
	i64 17704177640604968747, ; 292: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 76
	i64 17710060891934109755, ; 293: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 74
	i64 17882897186074144999, ; 294: FormsViewGroup => 0xf82cd03e3ac830e7 => 11
	i64 17891337867145587222, ; 295: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 127
	i64 17892495832318972303, ; 296: Xamarin.Forms.Xaml.dll => 0xf84eea293687918f => 115
	i64 17928294245072900555, ; 297: System.IO.Compression.FileSystem.dll => 0xf8ce18a0b24011cb => 138
	i64 17945795017270165205, ; 298: Xamarin.Google.Android.DataTransport.TransportApi.dll => 0xf90c457cc05cfed5 => 116
	i64 17986907704309214542, ; 299: Xamarin.GooglePlayServices.Basement.dll => 0xf99e554223166d4e => 122
	i64 18025913125965088385, ; 300: System.Threading => 0xfa28e87b91334681 => 148
	i64 18116111925905154859, ; 301: Xamarin.AndroidX.Arch.Core.Runtime => 0xfb695bd036cb632b => 45
	i64 18121036031235206392, ; 302: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 80
	i64 18129453464017766560, ; 303: System.ServiceModel.Internals.dll => 0xfb98c1df1ec108a0 => 141
	i64 18260797123374478311, ; 304: Xamarin.AndroidX.Emoji2 => 0xfd6b623bde35f3e7 => 62
	i64 18305135509493619199, ; 305: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 81
	i64 18337470502355292274, ; 306: Xamarin.Firebase.Messaging => 0xfe7bc8440c175072 => 111
	i64 18380184030268848184 ; 307: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 96
], align 8
@assembly_image_cache_indices = local_unnamed_addr constant [308 x i32] [
	i32 61, i32 21, i32 49, i32 88, i32 50, i32 25, i32 89, i32 55, ; 0..7
	i32 34, i32 73, i32 121, i32 137, i32 10, i32 66, i32 60, i32 135, ; 8..15
	i32 114, i32 153, i32 119, i32 44, i32 6, i32 103, i32 42, i32 75, ; 16..23
	i32 67, i32 23, i32 152, i32 43, i32 88, i32 117, i32 20, i32 39, ; 24..31
	i32 74, i32 99, i32 3, i32 130, i32 23, i32 79, i32 47, i32 60, ; 32..39
	i32 140, i32 87, i32 70, i32 54, i32 94, i32 35, i32 38, i32 36, ; 40..47
	i32 22, i32 83, i32 90, i32 16, i32 112, i32 119, i32 105, i32 69, ; 48..55
	i32 40, i32 33, i32 133, i32 102, i32 122, i32 92, i32 91, i32 32, ; 56..63
	i32 35, i32 1, i32 86, i32 61, i32 7, i32 152, i32 145, i32 14, ; 64..71
	i32 55, i32 106, i32 125, i32 117, i32 141, i32 96, i32 103, i32 72, ; 72..79
	i32 46, i32 38, i32 91, i32 4, i32 4, i32 113, i32 100, i32 77, ; 80..87
	i32 78, i32 94, i32 93, i32 142, i32 53, i32 28, i32 41, i32 16, ; 88..95
	i32 98, i32 51, i32 83, i32 71, i32 114, i32 11, i32 110, i32 8, ; 96..103
	i32 73, i32 70, i32 47, i32 58, i32 124, i32 140, i32 66, i32 37, ; 104..111
	i32 118, i32 33, i32 13, i32 15, i32 101, i32 68, i32 65, i32 5, ; 112..119
	i32 147, i32 143, i32 107, i32 106, i32 37, i32 34, i32 112, i32 100, ; 120..127
	i32 31, i32 129, i32 134, i32 42, i32 108, i32 123, i32 108, i32 139, ; 128..135
	i32 146, i32 69, i32 136, i32 2, i32 18, i32 146, i32 132, i32 151, ; 136..143
	i32 52, i32 82, i32 72, i32 111, i32 27, i32 63, i32 93, i32 18, ; 144..151
	i32 81, i32 138, i32 9, i32 24, i32 128, i32 85, i32 19, i32 19, ; 152..159
	i32 98, i32 43, i32 150, i32 32, i32 54, i32 24, i32 78, i32 104, ; 160..167
	i32 107, i32 21, i32 51, i32 135, i32 121, i32 63, i32 153, i32 31, ; 168..175
	i32 9, i32 15, i32 10, i32 130, i32 58, i32 127, i32 110, i32 149, ; 176..183
	i32 92, i32 133, i32 56, i32 20, i32 151, i32 12, i32 44, i32 41, ; 184..191
	i32 28, i32 36, i32 99, i32 97, i32 123, i32 50, i32 104, i32 57, ; 192..199
	i32 101, i32 84, i32 97, i32 68, i32 39, i32 90, i32 1, i32 65, ; 200..207
	i32 144, i32 2, i32 95, i32 145, i32 27, i32 126, i32 17, i32 64, ; 208..215
	i32 76, i32 59, i32 8, i32 48, i32 30, i32 49, i32 13, i32 131, ; 216..223
	i32 105, i32 17, i32 137, i32 62, i32 6, i32 95, i32 52, i32 120, ; 224..231
	i32 129, i32 45, i32 86, i32 134, i32 14, i32 128, i32 109, i32 64, ; 232..239
	i32 113, i32 26, i32 48, i32 148, i32 79, i32 84, i32 143, i32 71, ; 240..247
	i32 87, i32 126, i32 26, i32 77, i32 102, i32 120, i32 124, i32 57, ; 248..255
	i32 30, i32 59, i32 147, i32 85, i32 132, i32 0, i32 56, i32 149, ; 256..263
	i32 75, i32 29, i32 89, i32 115, i32 144, i32 125, i32 7, i32 3, ; 264..271
	i32 29, i32 131, i32 116, i32 139, i32 53, i32 82, i32 136, i32 22, ; 272..279
	i32 5, i32 150, i32 12, i32 40, i32 80, i32 67, i32 25, i32 0, ; 280..287
	i32 118, i32 46, i32 109, i32 142, i32 76, i32 74, i32 11, i32 127, ; 288..295
	i32 115, i32 138, i32 116, i32 122, i32 148, i32 45, i32 80, i32 141, ; 296..303
	i32 62, i32 81, i32 111, i32 96 ; 304..307
], align 4

@marshal_methods_number_of_classes = local_unnamed_addr constant i32 0, align 4

; marshal_methods_class_cache
@marshal_methods_class_cache = global [0 x %struct.MarshalMethodsManagedClass] [
], align 8; end of 'marshal_methods_class_cache' array


@get_function_pointer = internal unnamed_addr global void (i32, i32, i32, i8**)* null, align 8

; Function attributes: "frame-pointer"="non-leaf" "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics" uwtable willreturn writeonly
define void @xamarin_app_init (void (i32, i32, i32, i8**)* %fn) local_unnamed_addr #0
{
	store void (i32, i32, i32, i8**)* %fn, void (i32, i32, i32, i8**)** @get_function_pointer, align 8
	ret void
}

; Names of classes in which marshal methods reside
@mm_class_names = local_unnamed_addr constant [0 x i8*] zeroinitializer, align 8
@__MarshalMethodName_name.0 = internal constant [1 x i8] c"\00", align 1

; mm_method_names
@mm_method_names = local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	; 0
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		i8* getelementptr inbounds ([1 x i8], [1 x i8]* @__MarshalMethodName_name.0, i32 0, i32 0); name
	}
], align 8; end of 'mm_method_names' array


attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable willreturn writeonly "frame-pointer"="non-leaf" "target-cpu"="generic" "target-features"="+neon,+outline-atomics" }
attributes #1 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable "frame-pointer"="non-leaf" "target-cpu"="generic" "target-features"="+neon,+outline-atomics" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 1, !"branch-target-enforcement", i32 0}
!3 = !{i32 1, !"sign-return-address", i32 0}
!4 = !{i32 1, !"sign-return-address-all", i32 0}
!5 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
!6 = !{!"Xamarin.Android remotes/origin/d17-5 @ 45b0e144f73b2c8747d8b5ec8cbd3b55beca67f0"}
!llvm.linker.options = !{}
