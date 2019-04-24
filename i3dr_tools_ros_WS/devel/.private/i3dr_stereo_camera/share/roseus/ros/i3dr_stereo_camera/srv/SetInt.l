;; Auto-generated. Do not edit!


(when (boundp 'i3dr_stereo_camera::SetInt)
  (if (not (find-package "I3DR_STEREO_CAMERA"))
    (make-package "I3DR_STEREO_CAMERA"))
  (shadow 'SetInt (find-package "I3DR_STEREO_CAMERA")))
(unless (find-package "I3DR_STEREO_CAMERA::SETINT")
  (make-package "I3DR_STEREO_CAMERA::SETINT"))
(unless (find-package "I3DR_STEREO_CAMERA::SETINTREQUEST")
  (make-package "I3DR_STEREO_CAMERA::SETINTREQUEST"))
(unless (find-package "I3DR_STEREO_CAMERA::SETINTRESPONSE")
  (make-package "I3DR_STEREO_CAMERA::SETINTRESPONSE"))

(in-package "ROS")





(defclass i3dr_stereo_camera::SetIntRequest
  :super ros::object
  :slots (_data ))

(defmethod i3dr_stereo_camera::SetIntRequest
  (:init
   (&key
    ((:data __data) 0)
    )
   (send-super :init)
   (setq _data (round __data))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; int32 _data
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _data
       (write-long _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _data
     (setq _data (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass i3dr_stereo_camera::SetIntResponse
  :super ros::object
  :slots (_success _message ))

(defmethod i3dr_stereo_camera::SetIntResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass i3dr_stereo_camera::SetInt
  :super ros::object
  :slots ())

(setf (get i3dr_stereo_camera::SetInt :md5sum-) "41a6318c88ca9d75d7a585e2aa4ca6ea")
(setf (get i3dr_stereo_camera::SetInt :datatype-) "i3dr_stereo_camera/SetInt")
(setf (get i3dr_stereo_camera::SetInt :request) i3dr_stereo_camera::SetIntRequest)
(setf (get i3dr_stereo_camera::SetInt :response) i3dr_stereo_camera::SetIntResponse)

(defmethod i3dr_stereo_camera::SetIntRequest
  (:response () (instance i3dr_stereo_camera::SetIntResponse :init)))

(setf (get i3dr_stereo_camera::SetIntRequest :md5sum-) "41a6318c88ca9d75d7a585e2aa4ca6ea")
(setf (get i3dr_stereo_camera::SetIntRequest :datatype-) "i3dr_stereo_camera/SetIntRequest")
(setf (get i3dr_stereo_camera::SetIntRequest :definition-)
      "int32 data
---
bool success
string message
")

(setf (get i3dr_stereo_camera::SetIntResponse :md5sum-) "41a6318c88ca9d75d7a585e2aa4ca6ea")
(setf (get i3dr_stereo_camera::SetIntResponse :datatype-) "i3dr_stereo_camera/SetIntResponse")
(setf (get i3dr_stereo_camera::SetIntResponse :definition-)
      "int32 data
---
bool success
string message
")



(provide :i3dr_stereo_camera/SetInt "41a6318c88ca9d75d7a585e2aa4ca6ea")


