#include<iostream>
#include<cmath>
#include<iomanip>
using namespace std;

class NC{
public:
    float T=0.0001;
    float N=1000;
    int EQ=1;

    void SetEQ(int eq){
        EQ=eq;
    }
    int GetEQ(){
        return EQ;
    }

    float F(float x){
        float t;
        if(EQ==1){
            t=(x*x*x)-(2*x*x)-5;
        }
        else if(EQ==2){
            t=x - 0.8 - 0.2*sin(x);
        }
        return t;
    }

    float Fp(float x){
        float t;
        if(EQ==1){
            t=(3*x*x)-(4*x);
        }
        else if(EQ==2){
            t=1 - 0.2*cos(x);
        }
        return t;
    }

    void Bisection(float a,float b){
        cout<<"Bisection Method"<<endl;
        float FA,FP,p;
        //cout<<"i"\ta \t\tb \t\tp \t\tf(a) \t\tf(p)\n";
        cout<<setw(15)<<"i"<<setw(15)<<"a"<<setw(15)<<"b"<<setw(15)<<"p"<<setw(15)<<"f(a)"<<setw(15)<<"f(p)"<<endl;
        for(int i=0;i<N;i++){
            FA=F(a);
            p=(a+b)/2;
            FP=F(p);
            //cout<<i<<"\t\t"<<a<<"\t\t"<<b<<"\t\t"<<p<<"\t\t"<<FA<<"\t\t"<<FP<<endl;
            //cout<<setw(15)<<i<<"\t"<<setw(15)<<a<<"\t"<<setw(15)<<b<<"\t"<<setw(15)<<p<<"\t"<<setw(15)<<FA<<"\t"<<setw(15)<<FP<<endl;
            cout<<setw(15)<<i<<setw(15)<<a<<setw(15)<<b<<setw(15)<<p<<setw(15)<<FA<<setw(15)<<FP<<endl;
            if(FP==0 || ((b-a)/2)<T){
                cout<<"Final Value: "<<p<<endl;
                return;
            }
            if((FA*FP)>0){
                a=p;
            }
            else{
                b=p;
            }
        }
        cout<<"Solution did not fit within tolerance parameters"<<endl;
        return;
    }

    void Bisection1(float a,float b){
        if(a<b){
            float t=a;
            a=b;
            b=t;
        }
        cout<<"Iteration #\t\ta \t\tb \t\t c\t\t P(c)\n";
        float c=(a+b)/2;
        float d=F(c);;
        for(int i=0;i<N;i++,c=(a+b)/2,d=F(c)){
            cout<<i<<"\t\t"<<"\t\t"<<a<<"\t\t"<<b<<"\t\t"<<c<<"\t\t"<<d<<endl;
            if(d==0 || abs(d)<T){
                cout<<"Root Found: "<<c<<endl;
                break;
            }
            else if(d>0){
                a=c;
            }
            else{
                b=c;
            }
        }
        cout<<"Maximum Iterations Reached"<<endl;
        cout<<"Approximate Value: "<<c<<endl;
        return;
    }

    //Pn = Pn-1 - f((Pn-1)/f'(Pn-1))
    void Newton(float p0){
        cout<<"Newton-Raphson Method"<<endl;
        float p,d,Fp0,Fpp0;
        cout<<setw(3)<<"i"<<setw(15)<<"Po"<<setw(15)<<"f(Po)"<<setw(15)<<"f'(Po)"<<setw(15)<<"d\n";
        for(int i=0;i<N;i++){
            Fp0=F(p0);
            Fpp0=Fp(p0);
            p=p0-(Fp0/Fpp0);
            d=abs(p-p0);
            cout<<setw(3)<<i<<setw(15)<<p0<<setw(15)<<Fp0<<setw(15)<<Fpp0<<setw(15)<<d<<endl;
            //cout<<i<<"\t\t"<<p0<<"\t\t"<<p<<"\t\t"<<d<<endl;
            if(d<T){
                cout<<"Final Value: "<<p<<endl;
                return;
            }
            p0=p;
        }
        cout<<"Solution did not fit within tolerance parameters"<<endl;
    }


    //Pn = Pn-1 - ((f(Pn-1)(Pn-1-Pn-2))/(f(Pn-1)-f(Pn-2)))
    void Secant(float p0,float p1){
        cout<<"Secant Method"<<endl;
        float q0,q1,p,d;
        cout<<setw(4)<<"i"<<setw(15)<<"P0"<<setw(15)<<setw(15)<<"P1"<<setw(15)<<"q0"<<setw(15)<<"q1"<<setw(15)<<"d"<<endl;
        for(int i=0;i<N;i++){
            q0=F(p0);
            q1=F(p1);
            p=p1-q1*((p1-p0)/(q1-q0));
            d=abs(p-p1);
            cout<<setw(4)<<i<<setw(15)<<p0<<setw(15)<<setw(15)<<p1<<setw(15)<<q0<<setw(15)<<q1<<setw(15)<<d<<endl;
            if(d<T){
                cout<<"Final Value: "<<p<<endl;
                return;
            }
            p0=p1;
            p1=p;
        }
        cout<<"Solution did not fit within tolerance parameters"<<endl;
    }

    //Pn = Pn - ((Pn-1 - Pn)/(f(Pn-1)-f(Pn)))(f(Pn))
    void False(float p0,float p1){
        cout<<"False Position Method"<<endl;
        float q0,q1,p,d,q;
        q0=F(p0);
        q1=F(p1);
        cout<<setw(4)<<"i"<<setw(15)<<"P0"<<setw(15)<<setw(15)<<"P1"<<setw(15)<<"q"<<setw(15)<<"q0"<<setw(15)<<"q1"<<setw(15)<<"d"<<endl;
        for(int i=0;i<N;i++){
            p=p1-q1*((p1-p0)/(q1-q0));
            d=abs(p-p1);
            cout<<setw(4)<<i<<setw(15)<<p0<<setw(15)<<setw(15)<<p1<<setw(15)<<q<<setw(15)<<q0<<setw(15)<<q1<<setw(15)<<d<<endl;
            //cout<<i<<"\t\t"<<p0<<"\t\t"<<p1<<"\t\t"<<p<<"\t\t"<<d<<endl;
            if(d<T){
                cout<<"Final Value: "<<p<<endl;
                return;
            }
            q=F(p);
            if((q*q1)<0){
                p0=p1;
                q0=q1;
            }
            p1=p;
            q1=q;
        }
        cout<<"Solution did not fit within tolerance parameters"<<endl;
    }

};



int main(){
    NC A;
    //float a=1;float b=4;A.EQ=1;
    float a=0;float b=1.570796327;A.EQ=2;


    A.Bisection(a,b);
    A.Newton(a);
    A.Secant(a,b);
    A.False(a,b);
    return 0;
}

//5a x^3 - 2x^2 - 5 = 0, [1, 4]
//5d x - 0.8 - 0.2 sin x = 0, [0, π/2]
