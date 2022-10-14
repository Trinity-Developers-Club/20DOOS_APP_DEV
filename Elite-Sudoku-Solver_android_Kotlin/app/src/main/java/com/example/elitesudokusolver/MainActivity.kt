package com.example.elitesudokusolver

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.text.TextUtils
import android.widget.EditText

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

    }


    fun getsudoku(view: android.view.View) {
        var a = Array(9) { IntArray(9) }
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no0).text.toString())))
            a[0][0]= findViewById<EditText>(R.id.no0).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no1).text.toString())))
            a[0][1]= findViewById<EditText>(R.id.no1).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no2).text.toString())))
            a[0][2]= findViewById<EditText>(R.id.no2).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no3).text.toString())))
            a[0][3]= findViewById<EditText>(R.id.no3).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no4).text.toString())))
            a[0][4]= findViewById<EditText>(R.id.no4).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no5).text.toString())))
            a[0][5]= findViewById<EditText>(R.id.no5).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no6).text.toString())))
            a[0][6]= findViewById<EditText>(R.id.no6).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no7).text.toString())))
            a[0][7]= findViewById<EditText>(R.id.no7).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no8).text.toString())))
            a[0][8]= findViewById<EditText>(R.id.no8).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no9).text.toString())))
            a[1][0]= findViewById<EditText>(R.id.no9).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no10).text.toString())))
            a[1][1]= findViewById<EditText>(R.id.no10).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no11).text.toString())))
            a[1][2]= findViewById<EditText>(R.id.no11).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no12).text.toString())))
            a[1][3]= findViewById<EditText>(R.id.no12).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no13).text.toString())))
            a[1][4]= findViewById<EditText>(R.id.no13).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no14).text.toString())))
            a[1][5]= findViewById<EditText>(R.id.no14).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no15).text.toString())))
            a[1][6]= findViewById<EditText>(R.id.no15).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no16).text.toString())))
            a[1][7]= findViewById<EditText>(R.id.no16).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no17).text.toString())))
            a[1][8]= findViewById<EditText>(R.id.no17).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no18).text.toString())))
            a[2][0]= findViewById<EditText>(R.id.no18).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no19).text.toString())))
            a[2][1]= findViewById<EditText>(R.id.no19).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no20).text.toString())))
            a[2][2]= findViewById<EditText>(R.id.no20).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no21).text.toString())))
            a[2][3]= findViewById<EditText>(R.id.no21).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no22).text.toString())))
            a[2][4]= findViewById<EditText>(R.id.no22).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no23).text.toString())))
            a[2][5]= findViewById<EditText>(R.id.no23).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no24).text.toString())))
            a[2][6]= findViewById<EditText>(R.id.no24).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no25).text.toString())))
            a[2][7]= findViewById<EditText>(R.id.no25).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no26).text.toString())))
            a[2][8]= findViewById<EditText>(R.id.no26).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no27).text.toString())))
            a[3][0]= findViewById<EditText>(R.id.no27).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no28).text.toString())))
            a[3][1]= findViewById<EditText>(R.id.no28).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no29).text.toString())))
            a[3][2]= findViewById<EditText>(R.id.no29).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no30).text.toString())))
            a[3][3]= findViewById<EditText>(R.id.no30).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no31).text.toString())))
            a[3][4]= findViewById<EditText>(R.id.no31).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no32).text.toString())))
            a[3][5]= findViewById<EditText>(R.id.no32).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no33).text.toString())))
            a[3][6]= findViewById<EditText>(R.id.no33).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no34).text.toString())))
            a[3][7]= findViewById<EditText>(R.id.no34).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no35).text.toString())))
            a[3][8]= findViewById<EditText>(R.id.no35).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no36).text.toString())))
            a[4][0]= findViewById<EditText>(R.id.no36).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no37).text.toString())))
            a[4][1]= findViewById<EditText>(R.id.no37).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no38).text.toString())))
            a[4][2]= findViewById<EditText>(R.id.no38).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no39).text.toString())))
            a[4][3]= findViewById<EditText>(R.id.no39).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no40).text.toString())))
            a[4][4]= findViewById<EditText>(R.id.no40).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no41).text.toString())))
            a[4][5]= findViewById<EditText>(R.id.no41).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no42).text.toString())))
            a[4][6]= findViewById<EditText>(R.id.no42).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no43).text.toString())))
            a[4][7]= findViewById<EditText>(R.id.no43).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no44).text.toString())))
            a[4][8]= findViewById<EditText>(R.id.no44).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no45).text.toString())))
            a[5][0]= findViewById<EditText>(R.id.no45).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no46).text.toString())))
            a[5][1]= findViewById<EditText>(R.id.no46).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no47).text.toString())))
            a[5][2]= findViewById<EditText>(R.id.no47).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no48).text.toString())))
            a[5][3]= findViewById<EditText>(R.id.no48).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no49).text.toString())))
            a[5][4]= findViewById<EditText>(R.id.no49).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no50).text.toString())))
            a[5][5]= findViewById<EditText>(R.id.no50).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no51).text.toString())))
            a[5][6]= findViewById<EditText>(R.id.no51).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no52).text.toString())))
            a[5][7]= findViewById<EditText>(R.id.no52).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no53).text.toString())))
            a[5][8]= findViewById<EditText>(R.id.no53).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no54).text.toString())))
            a[6][0]= findViewById<EditText>(R.id.no54).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no55).text.toString())))
            a[6][1]= findViewById<EditText>(R.id.no55).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no56).text.toString())))
            a[6][2]= findViewById<EditText>(R.id.no56).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no57).text.toString())))
            a[6][3]= findViewById<EditText>(R.id.no57).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no58).text.toString())))
            a[6][4]= findViewById<EditText>(R.id.no58).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no59).text.toString())))
            a[6][5]= findViewById<EditText>(R.id.no59).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no60).text.toString())))
            a[6][6]= findViewById<EditText>(R.id.no60).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no61).text.toString())))
            a[6][7]= findViewById<EditText>(R.id.no61).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no62).text.toString())))
            a[6][8]= findViewById<EditText>(R.id.no62).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no63).text.toString())))
            a[7][0]= findViewById<EditText>(R.id.no63).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no64).text.toString())))
            a[7][1]= findViewById<EditText>(R.id.no64).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no65).text.toString())))
            a[7][2]= findViewById<EditText>(R.id.no65).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no66).text.toString())))
            a[7][3]= findViewById<EditText>(R.id.no66).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no67).text.toString())))
            a[7][4]= findViewById<EditText>(R.id.no67).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no68).text.toString())))
            a[7][5]= findViewById<EditText>(R.id.no68).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no69).text.toString())))
            a[7][6]= findViewById<EditText>(R.id.no69).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no70).text.toString())))
            a[7][7]= findViewById<EditText>(R.id.no70).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no71).text.toString())))
            a[7][8]= findViewById<EditText>(R.id.no71).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no72).text.toString())))
            a[8][0]= findViewById<EditText>(R.id.no72).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no73).text.toString())))
            a[8][1]= findViewById<EditText>(R.id.no73).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no74).text.toString())))
            a[8][2]= findViewById<EditText>(R.id.no74).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no75).text.toString())))
            a[8][3]= findViewById<EditText>(R.id.no75).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no76).text.toString())))
            a[8][4]= findViewById<EditText>(R.id.no76).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no77).text.toString())))
            a[8][5]= findViewById<EditText>(R.id.no77).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no78).text.toString())))
            a[8][6]= findViewById<EditText>(R.id.no78).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no79).text.toString())))
            a[8][7]= findViewById<EditText>(R.id.no79).text.toString().toInt()
        if (!(TextUtils.isEmpty(findViewById<EditText>(R.id.no80).text.toString())))
            a[8][8]= findViewById<EditText>(R.id.no80).text.toString().toInt()
        if(solvesudoku(a))
            showoutput(a)
        else
            allClear()
    }


    private fun showoutput(a: Array<IntArray>) {
        findViewById<EditText>(R.id.no0).setText(a[0][0].toString())
        findViewById<EditText>(R.id.no1).setText(a[0][1].toString())
        findViewById<EditText>(R.id.no2).setText(a[0][2].toString())
        findViewById<EditText>(R.id.no3).setText(a[0][3].toString())
        findViewById<EditText>(R.id.no4).setText(a[0][4].toString())
        findViewById<EditText>(R.id.no5).setText(a[0][5].toString())
        findViewById<EditText>(R.id.no6).setText(a[0][6].toString())
        findViewById<EditText>(R.id.no7).setText(a[0][7].toString())
        findViewById<EditText>(R.id.no8).setText(a[0][8].toString())
        findViewById<EditText>(R.id.no9).setText(a[1][0].toString())
        findViewById<EditText>(R.id.no10).setText(a[1][1].toString())
        findViewById<EditText>(R.id.no11).setText(a[1][2].toString())
        findViewById<EditText>(R.id.no12).setText(a[1][3].toString())
        findViewById<EditText>(R.id.no13).setText(a[1][4].toString())
        findViewById<EditText>(R.id.no14).setText(a[1][5].toString())
        findViewById<EditText>(R.id.no15).setText(a[1][6].toString())
        findViewById<EditText>(R.id.no16).setText(a[1][7].toString())
        findViewById<EditText>(R.id.no17).setText(a[1][8].toString())
        findViewById<EditText>(R.id.no18).setText(a[2][0].toString())
        findViewById<EditText>(R.id.no19).setText(a[2][1].toString())
        findViewById<EditText>(R.id.no20).setText(a[2][2].toString())
        findViewById<EditText>(R.id.no21).setText(a[2][3].toString())
        findViewById<EditText>(R.id.no22).setText(a[2][4].toString())
        findViewById<EditText>(R.id.no23).setText(a[2][5].toString())
        findViewById<EditText>(R.id.no24).setText(a[2][6].toString())
        findViewById<EditText>(R.id.no25).setText(a[2][7].toString())
        findViewById<EditText>(R.id.no26).setText(a[2][8].toString())
        findViewById<EditText>(R.id.no27).setText(a[3][0].toString())
        findViewById<EditText>(R.id.no28).setText(a[3][1].toString())
        findViewById<EditText>(R.id.no29).setText(a[3][2].toString())
        findViewById<EditText>(R.id.no30).setText(a[3][3].toString())
        findViewById<EditText>(R.id.no31).setText(a[3][4].toString())
        findViewById<EditText>(R.id.no32).setText(a[3][5].toString())
        findViewById<EditText>(R.id.no33).setText(a[3][6].toString())
        findViewById<EditText>(R.id.no34).setText(a[3][7].toString())
        findViewById<EditText>(R.id.no35).setText(a[3][8].toString())
        findViewById<EditText>(R.id.no36).setText(a[4][0].toString())
        findViewById<EditText>(R.id.no37).setText(a[4][1].toString())
        findViewById<EditText>(R.id.no38).setText(a[4][2].toString())
        findViewById<EditText>(R.id.no39).setText(a[4][3].toString())
        findViewById<EditText>(R.id.no40).setText(a[4][4].toString())
        findViewById<EditText>(R.id.no41).setText(a[4][5].toString())
        findViewById<EditText>(R.id.no42).setText(a[4][6].toString())
        findViewById<EditText>(R.id.no43).setText(a[4][7].toString())
        findViewById<EditText>(R.id.no44).setText(a[4][8].toString())
        findViewById<EditText>(R.id.no45).setText(a[5][0].toString())
        findViewById<EditText>(R.id.no46).setText(a[5][1].toString())
        findViewById<EditText>(R.id.no47).setText(a[5][2].toString())
        findViewById<EditText>(R.id.no48).setText(a[5][3].toString())
        findViewById<EditText>(R.id.no49).setText(a[5][4].toString())
        findViewById<EditText>(R.id.no50).setText(a[5][5].toString())
        findViewById<EditText>(R.id.no51).setText(a[5][6].toString())
        findViewById<EditText>(R.id.no52).setText(a[5][7].toString())
        findViewById<EditText>(R.id.no53).setText(a[5][8].toString())
        findViewById<EditText>(R.id.no54).setText(a[6][0].toString())
        findViewById<EditText>(R.id.no55).setText(a[6][1].toString())
        findViewById<EditText>(R.id.no56).setText(a[6][2].toString())
        findViewById<EditText>(R.id.no57).setText(a[6][3].toString())
        findViewById<EditText>(R.id.no58).setText(a[6][4].toString())
        findViewById<EditText>(R.id.no59).setText(a[6][5].toString())
        findViewById<EditText>(R.id.no60).setText(a[6][6].toString())
        findViewById<EditText>(R.id.no61).setText(a[6][7].toString())
        findViewById<EditText>(R.id.no62).setText(a[6][8].toString())
        findViewById<EditText>(R.id.no63).setText(a[7][0].toString())
        findViewById<EditText>(R.id.no64).setText(a[7][1].toString())
        findViewById<EditText>(R.id.no65).setText(a[7][2].toString())
        findViewById<EditText>(R.id.no66).setText(a[7][3].toString())
        findViewById<EditText>(R.id.no67).setText(a[7][4].toString())
        findViewById<EditText>(R.id.no68).setText(a[7][5].toString())
        findViewById<EditText>(R.id.no69).setText(a[7][6].toString())
        findViewById<EditText>(R.id.no70).setText(a[7][7].toString())
        findViewById<EditText>(R.id.no71).setText(a[7][8].toString())
        findViewById<EditText>(R.id.no72).setText(a[8][0].toString())
        findViewById<EditText>(R.id.no73).setText(a[8][1].toString())
        findViewById<EditText>(R.id.no74).setText(a[8][2].toString())
        findViewById<EditText>(R.id.no75).setText(a[8][3].toString())
        findViewById<EditText>(R.id.no76).setText(a[8][4].toString())
        findViewById<EditText>(R.id.no77).setText(a[8][5].toString())
        findViewById<EditText>(R.id.no78).setText(a[8][6].toString())
        findViewById<EditText>(R.id.no79).setText(a[8][7].toString())
        findViewById<EditText>(R.id.no80).setText(a[8][8].toString())


    }

    private fun isSafe(a : Array<IntArray>, row:Int, col:Int, num:Int):Boolean{
    for (i in 0..8) {
        if (a[row][i] == num) {
            return false
        }
    }
    for (r in 0..8) {
        if (a[r][col] == num) {
            return false
        }
    }
        val boxRowStart = row - row % 3
        val boxColStart = col - col % 3
        for (r in boxRowStart until boxRowStart + 3) {
            for (j in boxColStart until boxColStart + 3) {
                if (a[r][j] == num) {
                    return false
                }
            }
        }
        return true
    }
    private fun solvesudoku(a : Array<IntArray>):Boolean{
        var row = -1
        var col = -1
        var isEmpty = true
        for (i in 0..8) {
            for (j in 0..8) {
                if (a[i][j] == 0) {
                    row = i
                    col = j
                    isEmpty = false
                    break
                }
            }
            if (!isEmpty) {
                break
            }
        }
        if (isEmpty)
        {
            return true
        }
        for (num in 1..9) {
            if (isSafe(a, row, col, num)) {
                a[row][col] = num
                if (solvesudoku(a)) {
                    return true
                } else {
                    a[row][col] = 0
                }
            }
        }
        return false
    }

    fun clearOutput(view: android.view.View) {
        allClear()
    }

    private fun allClear() {
        findViewById<EditText>(R.id.no0).setText("")
        findViewById<EditText>(R.id.no1).setText("")
        findViewById<EditText>(R.id.no2).setText("")
        findViewById<EditText>(R.id.no3).setText("")
        findViewById<EditText>(R.id.no4).setText("")
        findViewById<EditText>(R.id.no5).setText("")
        findViewById<EditText>(R.id.no6).setText("")
        findViewById<EditText>(R.id.no7).setText("")
        findViewById<EditText>(R.id.no8).setText("")
        findViewById<EditText>(R.id.no9).setText("")
        findViewById<EditText>(R.id.no10).setText("")
        findViewById<EditText>(R.id.no11).setText("")
        findViewById<EditText>(R.id.no12).setText("")
        findViewById<EditText>(R.id.no13).setText("")
        findViewById<EditText>(R.id.no14).setText("")
        findViewById<EditText>(R.id.no15).setText("")
        findViewById<EditText>(R.id.no16).setText("")
        findViewById<EditText>(R.id.no17).setText("")
        findViewById<EditText>(R.id.no18).setText("")
        findViewById<EditText>(R.id.no19).setText("")
        findViewById<EditText>(R.id.no20).setText("")
        findViewById<EditText>(R.id.no21).setText("")
        findViewById<EditText>(R.id.no22).setText("")
        findViewById<EditText>(R.id.no23).setText("")
        findViewById<EditText>(R.id.no24).setText("")
        findViewById<EditText>(R.id.no25).setText("")
        findViewById<EditText>(R.id.no26).setText("")
        findViewById<EditText>(R.id.no27).setText("")
        findViewById<EditText>(R.id.no28).setText("")
        findViewById<EditText>(R.id.no29).setText("")
        findViewById<EditText>(R.id.no30).setText("")
        findViewById<EditText>(R.id.no31).setText("")
        findViewById<EditText>(R.id.no32).setText("")
        findViewById<EditText>(R.id.no33).setText("")
        findViewById<EditText>(R.id.no34).setText("")
        findViewById<EditText>(R.id.no35).setText("")
        findViewById<EditText>(R.id.no36).setText("")
        findViewById<EditText>(R.id.no37).setText("")
        findViewById<EditText>(R.id.no38).setText("")
        findViewById<EditText>(R.id.no39).setText("")
        findViewById<EditText>(R.id.no40).setText("")
        findViewById<EditText>(R.id.no41).setText("")
        findViewById<EditText>(R.id.no42).setText("")
        findViewById<EditText>(R.id.no43).setText("")
        findViewById<EditText>(R.id.no44).setText("")
        findViewById<EditText>(R.id.no45).setText("")
        findViewById<EditText>(R.id.no46).setText("")
        findViewById<EditText>(R.id.no47).setText("")
        findViewById<EditText>(R.id.no48).setText("")
        findViewById<EditText>(R.id.no49).setText("")
        findViewById<EditText>(R.id.no50).setText("")
        findViewById<EditText>(R.id.no51).setText("")
        findViewById<EditText>(R.id.no52).setText("")
        findViewById<EditText>(R.id.no53).setText("")
        findViewById<EditText>(R.id.no54).setText("")
        findViewById<EditText>(R.id.no55).setText("")
        findViewById<EditText>(R.id.no56).setText("")
        findViewById<EditText>(R.id.no57).setText("")
        findViewById<EditText>(R.id.no58).setText("")
        findViewById<EditText>(R.id.no59).setText("")
        findViewById<EditText>(R.id.no60).setText("")
        findViewById<EditText>(R.id.no61).setText("")
        findViewById<EditText>(R.id.no62).setText("")
        findViewById<EditText>(R.id.no63).setText("")
        findViewById<EditText>(R.id.no64).setText("")
        findViewById<EditText>(R.id.no65).setText("")
        findViewById<EditText>(R.id.no66).setText("")
        findViewById<EditText>(R.id.no67).setText("")
        findViewById<EditText>(R.id.no68).setText("")
        findViewById<EditText>(R.id.no69).setText("")
        findViewById<EditText>(R.id.no70).setText("")
        findViewById<EditText>(R.id.no71).setText("")
        findViewById<EditText>(R.id.no72).setText("")
        findViewById<EditText>(R.id.no73).setText("")
        findViewById<EditText>(R.id.no74).setText("")
        findViewById<EditText>(R.id.no75).setText("")
        findViewById<EditText>(R.id.no76).setText("")
        findViewById<EditText>(R.id.no77).setText("")
        findViewById<EditText>(R.id.no78).setText("")
        findViewById<EditText>(R.id.no79).setText("")
        findViewById<EditText>(R.id.no80).setText("")

    }

}



