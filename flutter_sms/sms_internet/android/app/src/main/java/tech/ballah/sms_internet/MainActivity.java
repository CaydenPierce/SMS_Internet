package tech.ballah.sms_internet;

import android.annotation.TargetApi;
import android.content.ContentResolver;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.provider.Telephony;
import android.util.Log;

import java.util.ArrayList;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;



public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "flutter.native/helper";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
  	super.onCreate(savedInstanceState);
	GeneratedPluginRegistrant.registerWith(this);

	  new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
		new MethodChannel.MethodCallHandler() {
		@Override
		public void onMethodCall(MethodCall call, MethodChannel.Result result) {
			if (call.method.equals("helloFromNativeCode")) {
				String greetings = helloFromNativeCode();
				Log.d("TEST", "$$$$$$$$$$$");
				testMMS();

				result.success(greetings);
			}
		}
	});


  }

    private String helloFromNativeCode() {
        return "Hello !";
    }


    //SMS Services

    @TargetApi(Build.VERSION_CODES.KITKAT)
	private void testMMS() {
		ContentResolver contentResolver = getContentResolver();
		grantUriPermission(this.getPackageName(), android.provider.Telephony.Mms.CONTENT_URI, Intent.FLAG_GRANT_READ_URI_PERMISSION);

		final String[] projection = new String[]{"_id", "ct_t", Telephony.Mms.CREATOR, Telephony.Mms.CONTENT_TYPE};
		Cursor query = contentResolver.query(android.provider.Telephony.Mms.CONTENT_URI, projection, null, null, null);
		ArrayList<String> dataArray = new ArrayList<>();

		if (query.moveToFirst()) {
			do {
				String string = query.getString(query.getColumnIndex("ct_t"));
				if ("application/vnd.wap.multipart.related".equals(string)) {
					// it's MMS
					String id = query.getString(query.getColumnIndex("_id"));
					String selectionPart = "mid=" + id;
					Uri uri = Uri.parse("content://mms/part");
					Cursor cursor = getContentResolver().query(uri, null,
							selectionPart, null, null);
					if (cursor.moveToFirst()) {
						do {
							String partId = cursor.getString(cursor.getColumnIndex("_id"));
							String type = cursor.getString(cursor.getColumnIndex("ct"));

							if ("image/jpeg".equals(type)) {
								String data = cursor.getString(cursor.getColumnIndex("_data"));
								Log.d("Data", data);

								if (data != null) {
								} else {
//									body = cursor.getString(cursor.getColumnIndex("text"));
								}
							} else {
								Log.d("TYPE", type);
							}

						} while (cursor.moveToNext());
					}

				} else {
					// it's SMS
				}


			} while (query.moveToNext());
		}

    }


}
