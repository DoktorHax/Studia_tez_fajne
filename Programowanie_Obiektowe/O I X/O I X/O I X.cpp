// O I X.cpp : Definiuje punkt wejścia dla aplikacji.
//

#include "stdafx.h"
#include "O I X.h"
#include <windowsx.h>

#define MAX_LOADSTRING 100

// Zmienne globalne:
HINSTANCE hInst;                                // bieżące wystąpienie
WCHAR szTitle[MAX_LOADSTRING];                  // Tekst paska tytułu
WCHAR szWindowClass[MAX_LOADSTRING];            // nazwa klasy okna głównego

const int CELL_SIZE = 100;
HBRUSH hbr1, hbr2;
HICON hIcon1, hIcon2;
int playerTurn = 1;
int gameBoard[9] = { 0,0,0,0,0,0,0,0,0 };
int winner = 0;
int wins[3];

BOOL GetGameBoardRect(HWND hwnd, RECT*pRect) {
	RECT rc;
	if (GetClientRect(hwnd, &rc)) {
		int width = rc.right - rc.left;
		int height = rc.bottom - rc.top;


		pRect->left = (width - CELL_SIZE * 3) / 2;
		pRect->top = (height - CELL_SIZE * 3) / 2;

		pRect->right = pRect->left + CELL_SIZE * 3;
		pRect->bottom = pRect->top + CELL_SIZE * 3;
		return TRUE;
	}
	SetRectEmpty(pRect);
	return FALSE;
}

void DrawLine(HDC hdc, int x1, int y1, int x2, int y2) {
	MoveToEx(hdc, x1, y1, NULL);
	LineTo(hdc, x2, y2);
}

int GetCellNumberFromPoint(HWND hwnd, int x, int y) {
	POINT pt = { x, y };
	RECT rc;

	if (GetGameBoardRect(hwnd, &rc)) {
		if (PtInRect(&rc, pt)) {
			x = pt.x - rc.left;
			y = pt.y - rc.top;

			int column = x / CELL_SIZE;
			int row = y / CELL_SIZE;

			return column + row * 3;
		}
	}
	return -1;
}

BOOL GetCellRect(HWND hWnd, int index, RECT * pRect) {
	RECT rcBoard;

	if (index < 0 || index > 8) {
		return FALSE;
	}

	if (GetGameBoardRect(hWnd, &rcBoard)) {
		//zmiana wartości na pozycje na planszy
		int y = index / 3; //Numer wiersza
		int x = index % 3; //Numer kolumny

		pRect->left = rcBoard.left + x * CELL_SIZE + 1;
		pRect->top = rcBoard.top + y * CELL_SIZE + 1;
		pRect->right = pRect->left + CELL_SIZE - 1;
		pRect->bottom = pRect->top + CELL_SIZE - 1;

		return TRUE;
	}

	return FALSE;
}

/*
	0|1|2
	3|4|5
	6|7|8
*/
int GetWinner(int wins[3]) {
	int cells[] = {
		0,1,2, 3,4,5, 6,7,8,
		0,3,6, 1,4,7, 2,5,8,
		0,4,8, 2,4,6 };
	//szukanie zwycięzcy
	for (int i = 0; i < ARRAYSIZE(cells); i += 3) {
		if ((0 != gameBoard[cells[i]]) && gameBoard[cells[i]] == gameBoard[cells[i + 1]] && gameBoard[cells[i]] == gameBoard[cells[i + 2]]) {
			//A zwycięzcą jest...
			wins[0] = cells[i];
			wins[1] = cells[i + 1];
			wins[2] = cells[i + 2];

			return gameBoard[cells[i]];
		}
	}
	for (int i = 0; i < ARRAYSIZE(gameBoard); ++i) {
		if (0 == gameBoard[i]) {
			return 0; //graj dalej
		}
	}
	return 3; //Remis
}

void ShowTurn(HWND hwnd, HDC hdc) {
	static const WCHAR szTurn1[] = L"Tura: Gracza 1";
	static const WCHAR szTurn2[] = L"Tura: Gracza 2";

	const WCHAR * pszTurnText = NULL;

	switch (winner) {
	case 0: //Kontynułuj grę
		pszTurnText = (playerTurn == 1) ? szTurn1 : szTurn2;
		break;
	case 1: //Gracz 1 Wygrał!
		pszTurnText = L"Wygrał Gracz 1!";
		break;
	case 2: //Gracz 2 Wygrał!
		pszTurnText = L"Wygrał Gracz 2!";
		break;
	case 3: //Remis
		pszTurnText = L"Remis";
		break;
	}

	RECT rc;

	if (NULL != pszTurnText && GetClientRect(hwnd, &rc)) {
		rc.top = rc.bottom - 48;
		FillRect(hdc, &rc, (HBRUSH)GetStockObject(WHITE_BRUSH));
		SetTextColor(hdc, RGB(0, 0, 0));
		SetBkMode(hdc, TRANSPARENT);
		DrawText(hdc, pszTurnText, lstrlen(pszTurnText), &rc, DT_CENTER);
	}
}
void DrawIconCentered(HDC hdc, RECT * pRect, HICON hIcon) {
	const int ICON_WIDTH = GetSystemMetrics(SM_CXICON);
	const int ICON_HEIGHT = GetSystemMetrics(SM_CXICON);
	if (NULL != pRect) {
		int left = pRect->left + ((pRect->right - pRect->left) - ICON_WIDTH) / 2;
		int top = pRect->top + ((pRect->bottom - pRect->top) - ICON_HEIGHT) / 2;
		DrawIcon(hdc, left, top, hIcon);
	}
}

void ShowWinner(HWND hwnd, HDC hdc) {
	RECT rcWin;

	for (int i = 0; i < 3; ++i) {
		if (GetCellRect(hwnd, wins[i], &rcWin)) {
			FillRect(hdc, &rcWin, (winner == 1) ? hbr1 : hbr2);
			DrawIconCentered(hdc, &rcWin, (winner == 1) ? hIcon1 : hIcon2);
		}
	}
}

// Przekaż dalej deklaracje funkcji dołączone w tym module kodu:
ATOM                MyRegisterClass(HINSTANCE hInstance);
BOOL                InitInstance(HINSTANCE, int);
LRESULT CALLBACK    WndProc(HWND, UINT, WPARAM, LPARAM);
INT_PTR CALLBACK    About(HWND, UINT, WPARAM, LPARAM);

int APIENTRY wWinMain(_In_ HINSTANCE hInstance,
	_In_opt_ HINSTANCE hPrevInstance,
	_In_ LPWSTR    lpCmdLine,
	_In_ int       nCmdShow)
{
	UNREFERENCED_PARAMETER(hPrevInstance);
	UNREFERENCED_PARAMETER(lpCmdLine);

	// TODO: W tym miejscu umieść kod.

	// Inicjuj ciągi globalne
	LoadStringW(hInstance, IDS_APP_TITLE, szTitle, MAX_LOADSTRING);
	LoadStringW(hInstance, IDC_OIX, szWindowClass, MAX_LOADSTRING);
	MyRegisterClass(hInstance);

	// Wykonaj inicjowanie aplikacji:
	if (!InitInstance(hInstance, nCmdShow)) {
		return FALSE;
	}

	HACCEL hAccelTable = LoadAccelerators(hInstance, MAKEINTRESOURCE(IDC_OIX));

	MSG msg;

	// Główna pętla komunikatów:
	while (GetMessage(&msg, nullptr, 0, 0)) {
		if (!TranslateAccelerator(msg.hwnd, hAccelTable, &msg)) {
			TranslateMessage(&msg);
			DispatchMessage(&msg);
		}
	}

	return (int)msg.wParam;
}



//
//  FUNKCJA: MyRegisterClass()
//
//  PRZEZNACZENIE: Rejestruje klasę okna.
//
ATOM MyRegisterClass(HINSTANCE hInstance) {
	WNDCLASSEXW wcex;

	wcex.cbSize = sizeof(WNDCLASSEX);

	wcex.style = CS_HREDRAW | CS_VREDRAW;
	wcex.lpfnWndProc = WndProc;
	wcex.cbClsExtra = 0;
	wcex.cbWndExtra = 0;
	wcex.hInstance = hInstance;
	wcex.hIcon = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_OIX));
	wcex.hCursor = LoadCursor(nullptr, IDC_ARROW);
	wcex.hbrBackground = (HBRUSH)(GetStockObject(WHITE_BRUSH));
	wcex.lpszMenuName = MAKEINTRESOURCEW(IDC_OIX);
	wcex.lpszClassName = szWindowClass;
	wcex.hIconSm = LoadIcon(wcex.hInstance, MAKEINTRESOURCE(IDI_SMALL));

	return RegisterClassExW(&wcex);
}

//
//   FUNKCJA: InitInstance(HINSTANCE, int)
//
//   PRZEZNACZENIE: Zapisuje dojście wystąpienia i tworzy okno główne
//
//   KOMENTARZE:
//
//        W tej funkcji dojście wystąpienia jest zapisywane w zmiennej globalnej i
//        jest tworzone i wyświetlane okno główne programu.
//
BOOL InitInstance(HINSTANCE hInstance, int nCmdShow) {
	hInst = hInstance; // Przechowuj dojście wystąpienia w naszej zmiennej globalnej

	HWND hWnd = CreateWindowW(szWindowClass, szTitle, WS_OVERLAPPEDWINDOW,
		CW_USEDEFAULT, 0, CW_USEDEFAULT, 0, nullptr, nullptr, hInstance, nullptr);

	if (!hWnd) {
		return FALSE;
	}

	ShowWindow(hWnd, nCmdShow);
	UpdateWindow(hWnd);

	return TRUE;
}

//
//  FUNKCJA: WndProc(HWND, UINT, WPARAM, LPARAM)
//
//  PRZEZNACZENIE: Przetwarza komunikaty dla okna głównego.
//
//  WM_COMMAND  - przetwarzaj menu aplikacji
//  WM_PAINT    - Maluj okno główne
//  WM_DESTROY  - opublikuj komunikat o wyjściu i wróć
//
//
LRESULT CALLBACK WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam) {
	switch (message) {
	case WM_CREATE: {
		hbr1 = CreateSolidBrush(RGB(255, 0, 0));
		hbr2 = CreateSolidBrush(RGB(0, 0, 255));
		
		//Ładowanie ikon graczy
		hIcon1 = LoadIcon(hInst, MAKEINTRESOURCE(IDI_PLAYER1));
		hIcon2 = LoadIcon(hInst, MAKEINTRESOURCE(IDI_PLAYER2));

	}
	break;
	case WM_COMMAND: {
		int wmId = LOWORD(wParam);
		// Analizuj zaznaczenia menu:
		switch (wmId) {
		case ID_PLIK_NOWAGRA: {
			int ret = MessageBox(hWnd, L"Jesteś pewien, że chcesz zacząć nową gre?", L"Nowa Gra", MB_YESNO | MB_ICONQUESTION);
			if (IDYES == ret) {
				//Rozpoczęcie nowej gry
				playerTurn = 1;
				winner = 0;
				ZeroMemory(gameBoard, sizeof(gameBoard));
				InvalidateRect(hWnd, NULL, TRUE);
				UpdateWindow(hWnd);
			}
		}
		break;
		case IDM_ABOUT:
			DialogBox(hInst, MAKEINTRESOURCE(IDD_ABOUTBOX), hWnd, About);
		break;
		case IDM_EXIT:
			DestroyWindow(hWnd);
		break;
		default:
			return DefWindowProc(hWnd, message, wParam, lParam);
		}
	}
	break;
	case WM_LBUTTONDOWN: {
		int xPos = GET_X_LPARAM(lParam);
		int yPos = GET_Y_LPARAM(lParam);

		//Obsługiwać kliknięcie tylko gdy jest czyjaś tura
		if (0 == playerTurn)
			break;
		int index = GetCellNumberFromPoint(hWnd, xPos, yPos);

		HDC hdc = GetDC(hWnd);
		if (NULL != hdc) {
			if (index != -1) {
				RECT rcCell;
				if ((gameBoard[index] == 0) && GetCellRect(hWnd, index, &rcCell)) {
					gameBoard[index] = playerTurn;
					
					DrawIconCentered(hdc, &rcCell, (playerTurn == 1) ? hIcon1 : hIcon2);
					//Szukanie zwycięzcy
					winner = GetWinner(wins);
					if (winner == 1 || winner == 2) {
						
						ShowWinner(hWnd, hdc);
						//Mamy zwycięzce
						MessageBox(hWnd, (winner == 1) ? L"Gracz 1 jest zwycięzcą" : L"Gracz 2 jest zwycięzcą", L"Wygrana!!!", MB_OK | MB_ICONINFORMATION);
						playerTurn = 0;
					}
					else if (3 == winner) {
						//Remis
						MessageBox(hWnd, L"Przykro mi ale zremisowaliście", L"Remis!", MB_OK | MB_ICONEXCLAMATION);
						playerTurn = 0;
					}
					else if (0 == winner) {
						playerTurn = (playerTurn == 1) ? 2 : 1;
					}
					//Pokaż ture
					ShowTurn(hWnd, hdc);
				}
			}
			ReleaseDC(hWnd, hdc);
		}
	}
	break;
	case WM_GETMINMAXINFO: {
		MINMAXINFO * pMinMax = (MINMAXINFO*)lParam;

		pMinMax->ptMinTrackSize.x = CELL_SIZE * 5;
		pMinMax->ptMinTrackSize.y = CELL_SIZE * 5;


	}
	break;
	case WM_PAINT: {
		PAINTSTRUCT ps;
		HDC hdc = BeginPaint(hWnd, &ps);
		RECT rc;

		if (GetGameBoardRect(hWnd, &rc)) {

			RECT rcClient;
			if (GetClientRect(hWnd, &rcClient)) {

				const WCHAR szPlayer1[] = L"Gracz 1";
				const WCHAR szPlayer2[] = L"Gracz 2";

				//Wyświetlenie gracz 1, gracz 2
				SetBkMode(hdc, TRANSPARENT);
				SetTextColor(hdc, RGB(255, 0, 0));
				TextOut(hdc, 16, 16, szPlayer1, ARRAYSIZE(szPlayer1));
				DrawIcon(hdc,24, 32, hIcon1);
				SetTextColor(hdc, RGB(0, 0, 255));
				TextOut(hdc, rcClient.right - 72, 16, szPlayer2, ARRAYSIZE(szPlayer2));
				DrawIcon(hdc, rcClient.right - 64, 32, hIcon2);

				//Pokaż ture
				ShowTurn(hWnd, hdc);
			}
			//Rysowanie planszy
			FillRect(hdc, &rc, (HBRUSH)GetStockObject(WHITE_BRUSH));

			for (int i = 1; i < 3; ++i) {
				//Rysuj linie w pionie
				DrawLine(hdc, rc.left + CELL_SIZE * i, rc.top, rc.left + CELL_SIZE * i, rc.bottom);
				//Rysuj linie w poziomie
				DrawLine(hdc, rc.left, rc.top + CELL_SIZE * i, rc.right, rc.top + CELL_SIZE * i);
			}

			//Rysowanie zajętych pól
			RECT rcCell;

			for (int i = 0; i < ARRAYSIZE(gameBoard); i++) {
				if ((gameBoard[i] != 0) && GetCellRect(hWnd, i, &rcCell)) {
					DrawIconCentered(hdc, &rcCell, (gameBoard[i] == 1) ? hIcon2 : hIcon1);
				}
			}
			if (winner == 1 || winner == 2) {
			//Pokaż zwycięzce
			ShowWinner(hWnd, hdc);
			}
		}
		EndPaint(hWnd, &ps);
	}
				   break;
	case WM_DESTROY:
		DeleteObject(hbr1);
		DeleteObject(hbr2);
		DestroyIcon(hIcon1);
		DestroyIcon(hIcon2);
		PostQuitMessage(0);
		break;
	default:
		return DefWindowProc(hWnd, message, wParam, lParam);
	}
	return 0;
}

// Procedura obsługi komunikatów dla okna informacji o programie.
INT_PTR CALLBACK About(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam) {
	UNREFERENCED_PARAMETER(lParam);
	switch (message) {
	case WM_INITDIALOG:
		return (INT_PTR)TRUE;

	case WM_COMMAND:
		if (LOWORD(wParam) == IDOK || LOWORD(wParam) == IDCANCEL) {
			EndDialog(hDlg, LOWORD(wParam));
			return (INT_PTR)TRUE;
		}
		break;
	}
	return (INT_PTR)FALSE;
}